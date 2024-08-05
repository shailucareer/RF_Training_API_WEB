*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1 - Radio button demo
    Open Browser    https://letcode.in/radio    headlesschrome
    Page Should Contain Radio Button    id:yes
    Page Should Not Contain Radio Button    id:yes1
    Radio Button Should Not Be Selected    answer
    Select Radio Button    answer    no
    Capture Page Screenshot
    Radio Button Should Be Set To    answer    no
