*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
TC2 - Click at coordinates demo
    Open Browser    https://www.w3schools.com/html/html_images_imagemap.asp        chrome
    Sleep    3s
    Maximize Browser Window
    Click Element At Coordinates    //img[@usemap='#workmap']    70    70       #Laptop
    Click Element At Coordinates    //img[@usemap='#workmap']    100    130     #Coffee

*** Keywords ***
TC1 - Clicks Demo
    Open Browser    https://letcode.in/buttons        chrome
    Sleep    3s
    Maximize Browser Window
    Click Element    id:position
    Sleep    1s
    Click Element    id:position    action_chain=true
    Sleep    1s
    Click Element    link:Sign up   modifier=CTRL
    Sleep    1s
    Close Browser