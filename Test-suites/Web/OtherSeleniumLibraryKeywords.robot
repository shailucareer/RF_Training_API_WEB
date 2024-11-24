*** Settings ***
Library    SeleniumLibrary      run_on_failure=My Failure Kw        screenshot_root_directory=${EXECDIR}/ss


*** Test Cases ***

Other kw of selenium library
    Open Browser    https://letcode.in/     headlesschrome
    #Register Keyword To Run On Failure      My Failure Kw
    #Set Screenshot Directory    ${EXECDIR}/ss
    Capture Page Screenshot
    Cover Element    xpath://a[.='New Course!']
    Capture Page Screenshot
    Click Element    id:123


*** Keywords ***
My Failure Kw
    Log    Hello World
    Capture Page Screenshot