*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
Handle Simple Alert
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts        chrome
    Click Element    //button[.='Click for JS Alert']
    Alert Should Be Present     text=I am a JS Alert
    Alert Should Not Be Present
    Wait Until Page Contains    You successfully clicked an alert


Handle Confirmation Alert
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts        chrome
    Click Element    //button[.='Click for JS Confirm']
    Alert Should Be Present     text=I am a JS Confirm
    Alert Should Not Be Present
    Wait Until Page Contains    You clicked: Ok

    Sleep    2s
    Click Element    //button[.='Click for JS Confirm']
    Alert Should Be Present     text=I am a JS Confirm      action=DISMISS
    Alert Should Not Be Present
    Wait Until Page Contains    You clicked: Cancel


    Sleep    2s
    Click Element    //button[.='Click for JS Confirm']
    Alert Should Be Present     text=I am a JS Confirm      action=LEAVE
    ${txt}      Handle Alert    action=DISMISS
    Log    ${txt}
    Alert Should Not Be Present
    Wait Until Page Contains    You clicked: Cancel
    Capture Page Screenshot


Handle Prompt Alert
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts        chrome
    Click Element    //button[.='Click for JS Prompt']
    Alert Should Be Present     text=I am a JS prompt       action=LEAVE
    Input Text Into Alert    Hello World
    Alert Should Not Be Present
    Wait Until Page Contains    You entered: Hello World


Handle Simple Alert with timeout
    Open Browser    https://letcode.in/waits        chrome
    Click Element    id:accept
    Alert Should Be Present     text=Finally I'm here, just to say Hi :)        timeout=10s
    Alert Should Not Be Present

Handling Custom Alert
    Open Browser    https://codepen.io/m4rc1nn/pen/NWwdvEB      chrome
    Sleep    2s
    Select Frame    id:result
    Click Element    //button[contains(.,'Custom Alert With Heading')]
    Wait Until Element Is Visible    //div[.='This is a custom alert with heading.']
    Sleep    1s
    Click Element    //button[.='OK']
    Wait Until Element Is Not Visible    //div[.='This is a custom alert with heading.']


Handling Toaster
    Open Browser    https://getbootstrap.com/docs/5.0/components/toasts/      chrome
    Sleep    2s
    #Maximize Browser Window
    Scroll Element Into View    id:translucent
    Click Element    id:liveToastBtn
    Wait Until Element Is Visible    (//div[contains(.,'Hello, world! This is a toast message.')][@class='toast-body'])[2]
    Click Element    (//button[@aria-label='Close'])[2]
    Wait Until Element Is Not Visible    (//div[contains(.,'Hello, world! This is a toast message.')][@class='toast-body'])[2]

