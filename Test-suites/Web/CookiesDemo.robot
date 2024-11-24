*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
Cookies Demo
    Open Browser    https://letcode.in/     headlesschrome
    ${cookies}     Get Cookies 
    Log    ${cookies}
    ${cookies}     Get Cookies      as_dict=True
    Log    ${cookies}
    ${cookie}       Get Cookie    _ga
    Log    ${cookie}
    Log    ${cookie.value}
    Add Cookie    mycookiename    mycookievalue
    ${cookies}     Get Cookies      as_dict=True
    Log    ${cookies}
    Delete Cookie    _ga
    ${cookies}     Get Cookies      as_dict=True
    Log    ${cookies}
    Delete All Cookies
    ${cookies}     Get Cookies      as_dict=True
    Log    ${cookies}