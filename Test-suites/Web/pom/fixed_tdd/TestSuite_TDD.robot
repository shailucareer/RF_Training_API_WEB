*** Settings ***
Resource    or/HomePage.robot
Resource    or/LoginPage.robot

*** Test Cases ***
Verify valid login
    Open Browser    https://automationexercise.com/     chrome
    Navigate to Sign up / Login Page
    Do Login    testteam.fullstack@gmail.com        Test@123
    Verify login is successfully done
    Close All Browsers

Verify invalid login
    [Template]  Verify invalid login - tdd template
    testteam.fullstack@gmail.com        ${EMPTY}
    testteam.fullstack@gmail.com        Test@1234
    testteam.fullstack@gmail.comm        Test@123

*** Keywords ***
Verify invalid login - tdd template
    [Arguments]     ${email_data}     ${pwd_data}
    Open Browser    https://automationexercise.com/     chrome
    Navigate to Sign up / Login Page
    Do Login    ${email_data}     ${pwd_data}
    Verify invalid username or pwd validation msg
    Close All Browsers
