
*** Settings ***
Documentation       Multiple site support Only blog owners can post to a blog, except administrators, who can post to all blogs.

Library    SeleniumLibrary
Library    String
Resource    or/HomePage_bdd.robot
Resource    or/LoginPage_bdd.robot
Resource    com/config.robot
Resource    com/CommonFeature.robot
Test Setup      Launch browser bdd
Test Teardown      Close browser bdd

*** Test Cases ***
Verify valid login works1
    Given Application is opened and Login page is displayed
    When I enter username "testteam.fullstack@gmail.com" and password "Test@123", try to login
    Then I should see home page, and logout button


Verify invalid login1
    [Template]          Verify invalid login - bdd template
    testteam.fullstack@gmail.com        ${EMPTY}
    testteam.fullstack@gmail.com        Test@1234
    testteam.fullstack@gmail.comm        Test@123


Verify valid login for shailendra customer1
    Given Application is opened and Login page is displayed
    When I enter username "testteam.fullstack@gmail.com" and password "Test@123", try to login
    Then I should see home page, and logout button
    ${actualString}     And Read the text from header for the logged in user
    And verify that name is "shailendra" is matching with "${actualString}"


*** Keywords ***
Read the text from header for the logged in user
    ${txt}      Tell me who logged in
    RETURN  ${txt}

verify that name is "${expectedString}" is matching with "${actualString}"
    ${actualString}     Convert To Lower Case   ${actualString}
    ${expectedString}     Convert To Lower Case   ${expectedString}
    Should Contain    ${actualString}    ${expectedString}


Verify invalid login - bdd template
    [Arguments]     ${username}     ${pwd}
    Given Application is opened and Login page is displayed
    When I enter username "${username}" and password "${pwd}", try to login
    Then Verify invalid username or pwd validation msg

Application is opened and Login page is displayed
    Log    step 1
    Navigate to Sign up / Login Page

I enter username "${username}" and password "${pwd}", try to login
    Log    step 2 ${username}-${pwd}
    Do Login    ${username}     ${pwd}

I should see home page, and logout button
    Log    step 3
    Verify login is successfully done
