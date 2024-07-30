*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***

Get Elem Atte or Get Dom Attr
    Open Browser    https://www.google.com/     chrome
    ${val}     Get Dom Attribute    SIvCob    id
    Log    ${val}
    ${val}     Get Element Attribute    SIvCob    id
    Log    ${val}

    ${val}     Get Dom Attribute    SIvCob    textContent
    Log    ${val}
    ${val}     Get Element Attribute    SIvCob    textContent
    Log    ${val}


    ${val}     Get Dom Attribute    SIvCob    innerHTML
    Log    ${val}
    ${val}     Get Element Attribute    SIvCob    innerHTML
    Log    ${val}


    ${val}     Get Dom Attribute    SIvCob    outerHTML
    Log    ${val}
    ${val}     Get Element Attribute    SIvCob    outerHTML
    Log    ${val}

Get Element Size
    Open Browser    https://www.google.com/     chrome
    ${width}    ${height}   Get Element Size    SIvCob
    Sleep    30s
    ${width}    ${height}   Get Element Size    SIvCob

    Set Window Size    200    1000
    ${width}    ${height}   Get Element Size    SIvCob
    # $$("#SIvCob")[0].style.display='None';
    
Get Element Position
    Open Browser    https://www.google.com/     chrome
    ${x}    Get Horizontal Position    SIvCob
    ${y}    Get Vertical Position    SIvCob   
    Log    ${x}
    Log    ${y}
    Maximize Browser Window
    ${x}    Get Horizontal Position    SIvCob
    ${y}    Get Vertical Position    SIvCob
    Log    ${x}
    Log    ${y}


Get Text and Value
    Open Browser    https://letcode.in/edit     chrome
    ${txt}     Get Text    xpath:(//label[@for='name'])[1]
    Log    ${txt}

    ${txt}     Get Text    id:join
    Log    ${txt}

    ${txt}     Get Value    id:join
    Log    ${txt}

    ${txt}     Get Element Attribute    id:join     value
    Log    ${txt}

    Go To    https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_textarea2
    Select Frame    id:iframeResult

    ${txt}     Get Text    id:w3review
    Log    ${txt}

    ${txt}     Get Value    id:w3review
    Log    ${txt}

    ${txt}     Get Element Attribute    id:w3review     textContent
    Log    ${txt}


Get WebElement And Webelements
    Open Browser    https://www.google.com/     chrome
    #${e1}     Get WebElement    q
    #${e2}     Get WebElements    q

    #${e1}     Get WebElement    q1
    ${e2}     Get WebElements    q1


Set focus to elem
    Open Browser    https://www.google.com/     chrome
    Sleep    3s
    ${txt}  Get Text    css:*:focus
    Set Focus To Element    link:हिन्दी
    ${txt}  Get Text    css:*:focus
    Click Element    css:*:focus



