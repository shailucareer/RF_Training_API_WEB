*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
TC1 - Text field demo
    Open Browser    https://letcode.in/edit   headlesschrome
    Page Should Contain Textfield    id:fullName
    Page Should Not Contain Textfield    id:fullName1
    Input Text    id:fullName    Hello
    Capture Page Screenshot
    Input Text    id:fullName    World      clear=False
    Capture Page Screenshot
    Textfield Should Contain    id:fullName   Hello
    Textfield Value Should Be    id:fullName    HelloWorld
    Input Password    id:fullName    ABCD
    Capture Page Screenshot
