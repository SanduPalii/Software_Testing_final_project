*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open google
    Open Browser    https://www.google.com/    Chrome

    Maximize Browser Window
    Page Should Contain    Accept all

    Click Element    id:L2AGLb
    
    Click Element    name:q
    Input Text    name:q    Cat

    #Click Button    name:btnK
    Click Button    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]


