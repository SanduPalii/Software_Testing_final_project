*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Facebook register
    Open Browser    https://www.facebook.com/     Chrome
    Sleep    2s
    Maximize Browser Window

    Page Should Contain    Only allow essential cookies
    Click Element    xpath://button[@title='Only allow essential cookies']
