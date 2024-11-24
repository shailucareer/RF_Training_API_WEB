*** Settings ***
Library    SeleniumLibrary
Resource    or/HomePage_Multi1.robot



*** Test Cases ***
Verify the navigation links are present or not
    Open Browser        https://www.twilio.com/en-us        chrome
    Maximize Browser Window
    Select the Language
    Verify the navigation links