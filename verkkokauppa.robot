*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Test Cases ***
Open google
    Open Browser    https://www.verkkokauppa.com/    Chrome

    Maximize Browser Window
    Page Should Contain    Käytämme evästeitä käyttökokemuksen parantamiseen
    
    #Sleep  2s
    Click Element    id:allow-cookies

    #Testing if every product category has an Icon

    #Sleep  2s
    Click Element    xpath:/html/body/div[1]/div[1]/header/div/label

    Sleep    2s

    ${count}=    Get Element Count    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul/li[*]

    Log    ${count}

    FOR    ${num}    IN RANGE    1    ${count}-2
        Page Should Contain Element    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul/li[${num}]/a/span
    END
    
    Sleep    1s
    Close All Browsers

*** Test Cases ***
Open verkkokauppa
    Open Browser    https://www.verkkokauppa.com/    Chrome

    Maximize Browser Window
    Page Should Contain    Käytämme evästeitä käyttökokemuksen parantamiseen
    
    Sleep  2s
    Click Element    id:allow-cookies

    #Testing if every product category has an Icon

    # Sleep  2s
    Click Element    xpath:/html/body/div[1]/div[1]/header/div/label
    Sleep    1s

    # Sleep    2s
    
    ${count}=    Get Element Count    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul/li[*]
    # -3 becouse the last 3 are not categories
    FOR    ${num}    IN RANGE    1    ${count}-2
        IF    ${num} > 14
            Click Element    xpath:/html/body/div[1]/div/div/aside/nav/div/div[3]/div[2]
            Sleep    1s
            Click Element    xpath:/html/body/div[1]/div/div/aside/nav/div/div[3]/div[2]
            Sleep    1s
            Click Element    xpath:/html/body/div[1]/div/div/aside/nav/div/div[3]/div[2]
            Sleep    2s
        END
        
        ${text}=    Get Text    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul/li[${num}]/a/span[2]
        Click Element    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul/li[${num}]/a
        Sleep  1s
        
        Page Should Contain    ${text}
        
        Sleep    1s
        Click Element    xpath:/html/body/div[1]/div[1]/header/div/label
        Sleep    1s
    END
    
    Close All Browsers

    