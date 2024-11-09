*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
Set Selenium Speed Demo
    Open Browser    https://letcode.in/test      chrome
#    Set Selenium Speed    2s
    Maximize Browser Window
    ${elem}     Get WebElement    link:Timeout
    Capture Page Screenshot
    Execute Javascript      ARGUMENTS   ${elem}     JAVASCRIPT  arguments[0].scrollIntoView(true);
    Capture Page Screenshot
#    Click Link    ${elem}
#    Wait Until Location Contains    waits
#    Click Element    id:accept
#    Wait For Expected Condition    alert_is_present
#    ${msg}     Handle Alert    ACCEPT
#    Log    ${msg}


Javascript Scroll into Middle view
    Open Browser    https://letcode.in/test      chrome
#    Set Selenium Speed    2s
    Maximize Browser Window
    ${elem}     Get WebElement    link:Timeout
    Capture Page Screenshot
    Execute Javascript      ARGUMENTS   ${elem}     JAVASCRIPT  var innerHeight = window.innerHeight;
    ...     var pos = arguments[0].getBoundingClientRect().top;
    ...     window.scrollTo(0,pos-innerHeight/2);
    Capture Page Screenshot



Set Selenium Page Load Timeout Demo
    Open Browser    browser=chrome
    Set Selenium Page Load Timeout    5s
    Go To    https://letcode.in/test
    ${elem}     Get WebElement    link:Timeout
    Capture Page Screenshot
    Execute Javascript      ARGUMENTS   ${elem}     JAVASCRIPT  var innerHeight = window.innerHeight;
    ...     var pos = arguments[0].getBoundingClientRect().top;
    ...     window.scrollTo(0,pos-innerHeight/2);
    Capture Page Screenshot

Set Selenium Timeout Demo
    Open Browser    https://the-internet.herokuapp.com/dynamic_loading/1      chrome
    Set Selenium Timeout    3s
    Click Element    xpath://button[.='Start']
    Wait Until Element Contains    id:finish    Hello World!
