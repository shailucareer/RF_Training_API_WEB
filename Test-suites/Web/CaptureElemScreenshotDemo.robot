*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
TC1 - Capture demo
    Open Browser    https://letcode.in/buttons        chrome
    Capture Page Screenshot
    Capture Element Screenshot    id:position
    Maximize Browser Window
    Capture Page Screenshot
    Capture Element Screenshot    id:position