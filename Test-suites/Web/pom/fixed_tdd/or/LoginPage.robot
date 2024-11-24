*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${email_txt}       name:email
${pwd_txt}          name:password
${login_btn}        xpath://button[.='Login']


${title}        Automation Exercise - Signup / Login


*** Keywords ***
Do Login
    [Arguments]     ${email_data}       ${pwd_data}
    Title Should Be    ${title}
    Input Text      ${email_txt}    ${email_data}
    Input Text      ${pwd_txt}     ${pwd_data}
    Click Element    ${login_btn}

Verify invalid username or pwd validation msg
    Wait Until Page Contains    Your email or password is incorrect!