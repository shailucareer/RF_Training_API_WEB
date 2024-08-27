*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1 File Upload demo
    Open Browser    https://the-internet.herokuapp.com/upload       chrome
    Log    ${CURDIR}
    #Choose File    id:file-upload    ${CURDIR}/findElementsDemo.png
    Choose File    id:file-upload    findElementsDemo.png
    Click Element    id:file-submit
    Sleep    5s