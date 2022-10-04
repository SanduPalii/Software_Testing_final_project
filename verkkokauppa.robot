*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open google
    Open Browser    https://www.verkkokauppa.com/    Chrome

    Maximize Browser Window
    Page Should Contain    Käytämme evästeitä käyttökokemuksen parantamiseen, analytiikkaan ja personoidun sisällön tuottamiseen. Suostumuksellasi käytämme evästeitä myös markkinoinnin kohdentamiseen.
    
    Sleep  2s
    Click Element    id:allow-cookies

    #Testing if every product category has an Icon

    Sleep  2s
    Click Element    xpath:/html/body/div[1]/div[1]/header/div/label

    Sleep    2s

    ${count}=    Get Element Count    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul

    FOR    ${num}    IN RANGE    1    ${count}
        Page Should Contain Element    xpath:/html/body/div[1]/div/div/aside/nav/div/div[2]/ul/li[${num}]/a/span[1]/svg
    END


