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

How Implicit and Dynamic Wait work with each other
    Open Browser    https://the-internet.herokuapp.com/dynamic_loading/1      chrome
    Set Selenium Implicit Wait    5s
    Wait Until Element Is Visible    xpath://button[.='Start1']     timeout=15s
    #Click Element    xpath://button[.='Start1']
    Sleep    5s


Wait For Condition Demo
    Open Browser    https://the-internet.herokuapp.com/dynamic_loading/1      chrome
    Wait For Condition    return document.querySelector("#finish").style.display == "none"
    Click Element    xpath://button[.='Start']
    Wait For Condition    return document.querySelector("#finish").style.display === ""     timeout=15s


Wait For Expected Condition Demo - with 2 arguments
    Open Browser    https://the-internet.herokuapp.com/dynamic_loading/1      chrome
    #Wait For Expected Condition    element_attribute_to_include(locator, attribute_)
    ${helloWorldData}       Evaluate    ("id","finish")
    Wait For Expected Condition    element_attribute_to_include     ${helloWorldData}       style
    Wait For Expected Condition    element_attribute_to_include     ${helloWorldData}       name

Wait For Expected Condition Demo - with WebElement & Tuple arguments
    Open Browser    https://the-internet.herokuapp.com/dynamic_loading/1      chrome
    ${startLoc}       Evaluate    ("xpath","//button[.='Start']")
    Wait For Expected Condition    element_to_be_clickable     ${startLoc}
    ${startElem}     Get WebElement    xpath://button[.='Start']
    Wait For Expected Condition    element_to_be_clickable     ${startElem}


Wait Until Element Contains Demo
    Open Browser    https://the-internet.herokuapp.com/dynamic_loading/1      chrome
    Click Element    xpath://button[.='Start']
    Wait Until Element Contains    id:finish    Hello World!
