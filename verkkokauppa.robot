*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Test Cases ***
Check icons in categories
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

Test landing pages
    Open Browser    https://www.verkkokauppa.com/    Chrome

    Maximize Browser Window
    Page Should Contain    Käytämme evästeitä käyttökokemuksen parantamiseen
    
    Sleep  2s
    Click Element    id:allow-cookies

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

Test search feature
    Open Browser    https://www.verkkokauppa.com/    Chrome

    ${ps5}=    Set Variable    ps5

    Maximize Browser Window
    Page Should Contain    Käytämme evästeitä käyttökokemuksen parantamiseen
    
    Sleep  2s
    Click Element    id:allow-cookies

    Input Text    xpath:/html/body/div[1]/div/header/div/nav/form/div/input    ${ps5}
    Sleep    2s

    Click Button    xpath:/html/body/div[1]/div/header/div/nav/form/div/div/button[2]
    Sleep    2s

    Capture Element Screenshot    xpath:/html/body/div[1]/div/div/div/main/div/div[2]/div[1]/ol/li[1]

    Click Element    xpath:/html/body/div[1]/div/div/div/main/div/div[2]/div[1]/ol/li[1]/article/a
    Sleep    2s

    Page Should Contain    ${ps5}

    Close All Browsers
