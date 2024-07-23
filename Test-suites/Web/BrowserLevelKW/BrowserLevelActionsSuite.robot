*** Settings ***
Library    SeleniumLibrary
Test Setup  Common Open Browser
Test Teardown   Common Close Browser

*** Keywords ***
Common Open Browser
    Log    Common Open Browser
    #${index}   Open Browser     https://www.fb.com    browser=HeadlessChrome   alias=C
Common Close Browser
    Log    Common Close Browser
    #Close All Browsers

*** Test Cases ***

Open browser demo
    ${index}   Open Browser    https://www.google.com      HeadlessChrome   alias=A
    Log    ${index}     #1
    Capture Page Screenshot
    ${index}   Open Browser    browser=HeadlessChrome   alias=A
    Log    ${index}     #1
    Capture Page Screenshot
    ${index}   Open Browser     https://www.fb.com    browser=HeadlessFirefox   alias=A
    Log    ${index}     #1
    Capture Page Screenshot
    Close All Browsers


Close browser demo
    ${index}   Open Browser    https://www.google.com      HeadlessChrome   alias=A
    Log    ${index}     #1
    Capture Page Screenshot

    ${index}   Open Browser    browser=HeadlessChrome   alias=B
    Log    ${index}     #2
    Capture Page Screenshot

    ${index}   Open Browser     https://www.fb.com    browser=HeadlessChrome   alias=C
    Log    ${index}     #3
    Capture Page Screenshot

    Switch Browser    2
    Close Browser
    Close All Browsers


Launching browser using selenium grid
    Open Browser    https://www.google.com  chrome  remote_url=http://192.168.1.68:4443
    Sleep    3s
    Close All Browsers

Get and Set window position
    Open Browser    https://www.google.com  chrome
    Sleep    3s
    ${x}    ${y}    Get Window Position
    Log    ${x},${y}

    Sleep    3s
    ${x}    ${y}    Get Window Position
    Log    ${x},${y}

    Maximize Browser Window
    ${x}    ${y}    Get Window Position
    Log    ${x},${y}

    Set Window Position    2000    300

Get and Set window size
    Open Browser    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Get%20Window%20Size     Chrome
    Set Window Position    2000    300
    Capture Page Screenshot

    ${x}    ${y}    Get Window Size
    Log    ${x},${y}

    Set Window Size    20000    10000   inner=true
    Capture Page Screenshot
    ${x}    ${y}    Get Window Size
    Log    ${x},${y}


    Set Window Size    200    800
    Capture Page Screenshot
    ${x}    ${y}    Get Window Size
    Log    ${x},${y}

