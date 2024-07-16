
*** Settings ***
Library     SeleniumLibrary     timeout=7   implicit_wait=5
Library    String

*** Variables ***
${queryObj}     name:q1

*** Keywords ***
Get locator tuple
    [Arguments]     ${locator}
    ${parts}    Split String    ${locator}      :
    ${tuple}    Evaluate    tuple(${parts})
    RETURN  ${tuple}

*** Test Cases ***
TC1 Wait For Expected Condition demo with Tuple
    Open Browser    https://www.google.com      chrome
    #Set Selenium Timeout    5s
    Sleep    5s
    ${byElem}     Evaluate      ("name","q1")
    Wait For Expected Condition    visibility_of_element_located    ${byElem}       timeout=5
    Input Text    name:q1    Hello
    Sleep    2s

TC2 - Wait For Expected Condition Demo with Default timeout override with tuple
    Open Browser    https://www.google.com      chrome
    #Set Selenium Timeout    5s
    Sleep    5s
    ${byElem}     Get locator tuple    ${queryObj}
    Wait For Expected Condition    visibility_of_element_located    ${byElem}       timeout=5
    Input Text    ${queryObj}   Hello
    Sleep    2s
    
TC3 - Default imeout override
    Open Browser    https://www.google.com      headlesschrome
    Set Selenium Timeout    3s
    Sleep    5s
    #Input Text    ${queryObj}   Hello
    Wait Until Page Contains    Hello       timeout=2
    Sleep    2s

TC4 - Implicit wait demo
    Open Browser    https://www.google.com      headlesschrome
    #Input Text    ${queryObj}   Hello
    Wait Until Page Contains    Hello       #timeout=2
