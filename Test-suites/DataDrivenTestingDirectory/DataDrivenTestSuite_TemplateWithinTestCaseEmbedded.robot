
*** Variables ***
${USER NAME}    USER1
${PWD}          PWD1
${EMAIL}        EMAIL@GMAIL.COM

*** Test Cases ***
Perform Test With Admin Credentials
    [Template]  This is my higher level keyword with ebdedded "${user}", "${pwd}" and "${email}"
    ${USER NAME}       ${PWD}       ${EMAIL}
    USER2               PWD2        ${EMPTY}
    USER2               PWD2        ${EMPTY}

Perform Test With Admin Credentials with only 2 arguments
    [Template]  This is my higher level keyword with ebdedded "${user}", "${pwd}" and "myemail@gmail.com"
    ${USER NAME}       ${PWD}
    USER2               PWD2
    USER3               PWD3

Other Test Case
    Log    Hello I am SSR

*** Keywords ***

This is my higher level keyword with ebdedded "${user}", "${pwd}" and "${email}"
    Perform Login        ${user}     ${pwd}
    Navigate to the page
    Perform the test and verify results     ${email}

Perform Login
    [Arguments]     ${user}     ${pwd}
    Log    ${user} - ${pwd}
    Log    I am performing login action

Navigate to the page
    Log    I am doing navigation

Perform the test and verify results
    [Arguments]     ${email}
    Log    I am doing the testing and verification ${email}


