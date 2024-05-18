*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open browser and search Automation testing text
    Open Browser    https://www.google.com      chrome
    Input Text    name:q    Automation testing
    Press Keys    name:q    ENTER
    Sleep    5s