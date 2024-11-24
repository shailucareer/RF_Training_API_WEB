*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${signup_login_link}        xpath://a[.=' Signup / Login']
${logout_link}              xpath://a[.=' Logout']


*** Keywords ***
Navigate to Sign up / Login Page
    Click Element       ${signup_login_link}

Verify login is successfully done
    Wait Until Element Is Visible    ${logout_link}