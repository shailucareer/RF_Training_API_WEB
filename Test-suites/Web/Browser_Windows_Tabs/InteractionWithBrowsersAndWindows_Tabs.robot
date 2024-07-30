*** Settings ***
Library    SeleniumLibrary
Library    Collections


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


Go to & Go Back Demo
     Open Browser     	https://robotframework.org     chrome
     Sleep    3s
     Go To    https://www.google.com
     Go Back

     Open Browser     	browser=chrome
     Sleep    3s
     Go To    https://www.google.com

Get browser aliases example
    Open Browser     	https://www.google.com     chrome   alias=A     #1
    Sleep    2s
    Capture Page Screenshot

    Open Browser     	https://www.google.com  browser=chrome      alias=B     #2
    Sleep    2s
    Capture Page Screenshot
    
    Open Browser     	https://www.google.com  browser=chrome      #3
    Sleep    2s
    Capture Page Screenshot

    Switch Browser    A
    Input Text    q    Hello World
    Capture Page Screenshot

    ${listOfAliases}    Get Browser Aliases
    Log    ${listOfAliases}
    #  ${aliases.key} or as list @{aliases}[0]
    #Log    ${listOfAliases[A]}
    #Log    ${listOfAliases[B]}
    Log    ${listOfAliases}[A]
    ${keys}     Get Dictionary Keys     ${listOfAliases}

    ${listOfIds}    Get Browser Ids
    Log    ${listOfIds}


Get Location and Locations example
    Open Browser     	https://www.google.com     chrome   alias=A     #1
    #Sleep    2s
    Capture Page Screenshot
    Execute Javascript      window.open()
    Switch Window      NEW
    Go To    https://robotframework.org

    Open Browser     	https://www.fb.com  browser=chrome      alias=B     #2
    #Sleep    2s
    Capture Page Screenshot

    Open Browser     	https://www.x.com  browser=chrome   alias=C      #3
    #Sleep    2s
    Capture Page Screenshot

    Switch Browser    A
    #Input Text    q    Hello World
    Capture Page Screenshot

    ${loc}      Get Location
    Log    ${loc}

    ${locs}      Get Locations
    Log    ${locs}

    ${locs}      Get Locations      browser=B
    Log    ${locs}

    ${sessionId}    Get Session Id
    Log    ${sessionId}

Get Source Example
    Open Browser     	https://www.google.com     chrome   alias=A     #1
    ${HtmlCode}     Get Source
    Log    ${HtmlCode}

Get Title Example
    Open Browser     	https://www.google.com     chrome   alias=A     #1
    ${title}     Get Title
    Log    ${title}

Location should be and contains
    Open Browser     	https://www.google.com     chrome   alias=A     #1
    Location Should Be    https://www.google.com/
    Location Should Contain    google.com
