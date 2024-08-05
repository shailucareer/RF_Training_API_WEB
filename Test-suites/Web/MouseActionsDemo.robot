*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1 - Mouse Long Press Demo
    Open Browser    https://letcode.in/buttons      chrome
    Sleep    3s
    Mouse Down    xpath://button[@id='isDisabled'][@class='button is-primary']
    Sleep    2s
    Mouse Up     xpath://button[@id='isDisabled'][@class='button is-primary']
    Sleep    2s

TC2 - Mouse Action Drag Drop Demo
    Open Browser    https://letcode.in/dropable      chrome
    Sleep    3s
    Drag And Drop By Offset    id:draggable    50    50
    Drag And Drop    id:draggable   id:droppable
    Sleep    2s
    


TC3 - Mouse Action Drag Drop Demo
    Open Browser    https://letcode.in/edit      chrome
    Sleep    3s
    Double Click Element    id:clearMe
    Sleep    2s
    Mouse Over    link:Courses
    Sleep    2s
    Mouse Over    link: Selenium-Java 
    Open Context Menu    link: Selenium-Java
    Sleep    2s