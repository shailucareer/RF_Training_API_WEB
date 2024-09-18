*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
TC1 - Letcode wait for alert
    Open Browser    https://letcode.in/test      chrome
    Maximize Browser Window
    ${elem}     Get WebElement    link:Timeout
    Capture Page Screenshot
    Execute Javascript      ARGUMENTS   ${elem}     JAVASCRIPT  arguments[0].scrollIntoView(true);
    Capture Page Screenshot
    Click Link    ${elem}
    Wait Until Location Contains    waits 
    Click Element    id:accept
    Wait For Expected Condition    alert_is_present
    ${msg}     Handle Alert    ACCEPT
    Log    ${msg}