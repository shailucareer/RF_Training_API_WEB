*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Open a new tab in my browser
    Open Browser    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html     chrome
    Maximize Browser Window
    Sleep    5s
    Execute Javascript      window.open()
    Sleep    2s
    Switch Window       NEW
    Go To    https://robotframework.org/robotframework/latest/libraries/String.html

Same test multiple browsers and switching between them - SIMPLY
    Open Browser     	https://robotframework.org     chrome   alias=BrowserA
    Sleep    5s
    Execute Javascript      window.open()
    Switch Window       NEW
    Go To    https://robocon.io/
    Sleep    5s
    Execute Javascript      window.open()
    Switch Window       NEW
    Sleep    5s
    Go To    https://github.com/robotframework
    Open Browser     	https://github.com/     chrome   alias=BrowserB
    Sleep    5s


Same test multiple browsers and switching between them - COMPLEX
    Open Browser     	https://robotframework.org     chrome   alias=BrowserA      #TAB1
    Sleep    2s
    Open Browser     	https://github.com/     chrome   alias=BrowserB
    Sleep    2s
    Switch Window       MAIN    browser=BrowserA
    Execute Javascript      window.open()
    ${handle}       Switch Window       NEW
    Go To    https://robocon.io/                                                     #TAB2
    Sleep    2s
    Execute Javascript      window.open()
    Switch Window       NEW
    Sleep    2s
    Go To    https://github.com/robotframework                                       #TAB3
    ${url}      Get Location
    Log    ${url}
    ${url}      Get Locations
    FOR    ${element}    IN    @{url}
        Log    ${element}
    END

    ${url}      Get Locations        	browser=ALL
    FOR    ${element}    IN    @{url}
        Log    ${element}
    END

