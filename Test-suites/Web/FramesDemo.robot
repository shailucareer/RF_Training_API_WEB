*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
TC1 Frame demo
    Open Browser    https://the-internet.herokuapp.com/iframe        chrome
    Page Should Contain    Your content goes here.

TC2 Frame demo
    Open Browser    https://the-internet.herokuapp.com/nested_frames        chrome
    Select Frame    name:frame-top
    Select Frame    name:frame-left
    ${txt}      Get Text    xpath://body
    Log    ${txt}
    Unselect Frame
    Select Frame    name:frame-top
    Select Frame    name:frame-right
    ${txt}      Get Text    xpath://body
    Log    ${txt}
    Unselect Frame
    Select Frame     name:frame-bottom
    ${txt}      Get Text    xpath://body
    Log    ${txt}
