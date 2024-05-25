


*** Test Cases ***
Adding a tc from github
    Log    Hello from github G

Adding a tc from pycharm
    Log    Hello from pycharm

BDD Demo 1
    Given Custom Keyword 1

BDD Demo 2
    Given a user is on the login page
    When the user enters their username and password and clicks the login button
    Then the user should be directed to the home page.

BDD Demo 3
    Given a user is on the login page
    When the user enters their username "ssr@test.com" and password "ssrtest" and clicks the login button
    Then the user should be directed to the home page.

BDD Demo 4
    Given a user is on the login page
    When the user enters their username and password and clicks the login button    ssr@test.com      ssrtest
    Then the user should be directed to the home page.

*** Keywords ***
Custom Keyword 1
    Log    Hello

a user is on the login page
    Log    User is on login page

the user enters their username and password and clicks the login button
    [Arguments]     ${email}=abc@test.com   ${pwd}=test123
    Log    ${email} ${pwd}
    Log    the user enters their username and password and clicks the login button

the user should be directed to the home page.
    Log    the user should be directed to the home page.

the user enters their username "${email}" and password "${pwd}" and clicks the login button
    Log    ${email} ${pwd}
