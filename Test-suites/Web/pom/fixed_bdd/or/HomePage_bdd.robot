*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${signup_login_link}        xpath://a[.=' Signup / Login']
${logout_link}              xpath://a[.=' Logout']
${link_LoggedInAs}          xpath://a[contains(.,'Logged in as')]

${title}        Automation Exercise


*** Keywords ***
Navigate to Sign up / Login Page
    Click Element       ${signup_login_link}

Verify login is successfully done
    Title Should Be    ${title}
    Wait Until Element Is Visible    ${logout_link}

Tell me who logged in
    ${txt}  Get Text    ${link_LoggedInAs}
    RETURN  ${txt}