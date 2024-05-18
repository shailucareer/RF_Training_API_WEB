
*** Settings ***
Test Template       This is my higher level keyword

*** Variables ***
${USER NAME}    USER1
${PWD}          PWD1


*** Test Cases ***      USERNAME        PASSWORD
Perform Test With Admin Credentials             ${USER NAME}       ${PWD}
Perform Test With Super Admin Credentials       USER2       PWD2
Perform Test With Customer Credentials          USER2       PWD2

Other TestCase
    [Template]      None
    Log     Hello I am SSR

*** Keywords ***

This is my higher level keyword
    [Arguments]     ${user}     ${pwd}
    Perform Login        ${user}     ${pwd}
    Navigate to the page
    Perform the test and verify results

Perform Login
    [Arguments]     ${user}     ${pwd}
    Log    ${user} - ${pwd}
    Log    I am performing login action

Navigate to the page
    Log    I am doing navigation

Perform the test and verify results
    Log    I am doing the testing and verification


