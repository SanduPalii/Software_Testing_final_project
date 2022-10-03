*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open google
    Open Browser    https://www.verkkokauppa.com/    Chrome

    Maximize Browser Window
    Page Should Contain    Käytämme evästeitä käyttökokemuksen parantamiseen, analytiikkaan ja personoidun sisällön tuottamiseen. Suostumuksellasi käytämme evästeitä myös markkinoinnin kohdentamiseen.
    
    Sleep  2s
    Click Element    id:allow-cookies

    Sleep  2s
    Click Element    xpath:/html/body/div[1]/div[1]/header/div/label
    # Click Element    name:q
    # Input Text    name:q    Cat

    # #Click Button    name:btnK
    # Click Button    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]


