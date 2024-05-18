


*** Test Cases ***
TC 1
    This is my higher level keyword     USER1   PWD1
    This is my higher level keyword     USER2   PWD2
    This is my higher level keyword     USER3   PWD3

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


