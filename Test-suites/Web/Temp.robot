*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Element Current State
    Open Browser    https://www.google.com  chrome  alias=A
    ${at}   Get Dom Attribute    q    role
    Log    ${at}
    ${at}   Get Dom Attribute    q    style
    Log    ${at}
    ${at}   Evaluate    type(${at})
    Log    ${at}
    ${at}    Get Element Attribute    SIvCob    textContent
    Log    ${at}
    ${at}    Get Element Attribute    SIvCob    innerHTML
    Log    ${at}
    ${at}    Get Element Attribute    SIvCob    outerHTML
    Log    ${at}
    ${at}    Get Dom Attribute    SIvCob    textContent
    Log    ${at}
    ${at}    Get Dom Attribute    SIvCob    innerHTML
    Log    ${at}
    ${at}    Get Dom Attribute    SIvCob    outerHTML
    Log    ${at}


Element Count Size
    Open Browser    https://www.google.com  chrome  alias=A
    ${at}   Get Element Count    tag:textarea
    Log    ${at}
    ${at}   Get Element Count    tag:a
    Log    ${at}
    ${w}    ${h}   Get Element Size    q
    Log    ${w}
    Log    ${h}
    ${w}        Get Horizontal Position    q
    Log    ${w}
    ${w}        Get Vertical Position    q
    Log    ${w}
    Maximize Browser Window

    ${w}        Get Horizontal Position    q
    Log    ${w}
    ${w}        Get Vertical Position    q
    Log    ${w}


    ${at}    Get Property    SIvCob    innerText
    Log    ${at}

    ${at}    Get Property    SIvCob    text_length
    Log    ${at}

    ${at}    Get Element Attribute    SIvCob    text_length
    Log    ${at}

Get Webelement
    Open Browser    https://www.google.com  chrome  alias=A
    ${at}   Get WebElement    q
    Log    ${at}
    ${at}   Get WebElements    q1
    Log    ${at}
    Set Focus To Element    link:हिन्दी
    Capture Element Screenshot    css:*:focus
    Get Text    css:*:focus
    Click Element    css:*:focus


Click element at coord demo
    Open Browser    https://www.google.com  chrome  alias=A
    ${w}    ${h}   Get Element Size    q
    Log    ${w}
    Log    ${h}
    Click Element At Coordinates    q   445  10