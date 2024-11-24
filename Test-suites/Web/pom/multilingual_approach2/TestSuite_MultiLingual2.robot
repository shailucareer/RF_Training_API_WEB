*** Settings ***
Resource    util/Locale.robot
Resource    or/HomePage_Multi2.robot
Suite Setup     Load the locator excel file and store its content in a locators dictionary

*** Test Cases ***
Verify the navigation links are present or not1
    Open Browser        https://www.twilio.com/en-us        chrome
    Maximize Browser Window
    Select the Language
    Verify the navigation links


Verify the navigation links are present or not2
    Log    hello

Verify the navigation links are present or not3
    Log    hello
Verify the navigation links are present or not4
    Log    hello
Verify the navigation links are present or not5
    Log    hello
