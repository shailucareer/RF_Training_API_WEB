*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
Locating elements with different strategies
    Open Browser    https://letcode.in/forms    headlesschrome
    Maximize Browser Window
#    Input Text    firstname    DATA1
#    ${oldval}   Get Element Attribute    firstname    value
#    Input Text    id:firstname    ${oldval}DATA2
#    Input Text    class:input    DATA3
#    Input Text    tag:input    DATA
    #Click Element    link:Work-Space
    Click Element    partial link:-Space
    Click Element    xpath://input[@id='male']
    Click Element    css:input[id='female']
    Click Element    //input[@id='male']
    Input Text    dom:document.getElementById("lasttname")      DATA1
    Sleep    5s

