*** Settings ***
Library    SeleniumLibrary
Library    String



*** Test Cases ***
Locating elements with different strategies
    Open Browser    https://letcode.in/forms    chrome
    Maximize Browser Window
#    Input Text    firstname    DATA1
#    ${oldval}   Get Element Attribute    firstname    value
#    Input Text    id:firstname    ${oldval}DATA2
#    Input Text    class:input    DATA3
#    Input Text    tag:input    DATA
    #Click Element    link:Work-Space
    Click Element    partial link:-Space
    Click Element    xpath://input[@id='male']
    Click Element    css:input[id='female']
    Click Element    //input[@id='male']
    Input Text    dom:document.getElementById("lasttname")      DATA1
    Sleep    5s

Chaining Locators
    Open Browser    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html     chrome
    Maximize Browser Window
    Sleep    5s
    Click Element    id:keyword-shortcuts-container >> link:Click Button
    Sleep    2s

Using Webelement objects
    Open Browser    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html     chrome
    Maximize Browser Window
    Sleep    5s
    ${AllLinks}     Get WebElements    id:keyword-shortcuts-container >> tag:a
    ${len}      Get Length    ${AllLinks}
    Log    ${len}
    #Click Element    ${AllLinks}[1]
    FOR    ${element}    IN    @{AllLinks}
        ${linktext}     Get Text    ${element}
        Log       ${linktext}
    END
    Sleep    2s


Custom Locator Example - without using custom locator strategy
    Open Browser    https://letcode.in/advancedtable     chrome
    Maximize Browser Window
    Sleep    5s
    ${text}     Get Text    xpath://table[@id='advancedtable']/tbody/tr[2]/td[2]
    Log    ${text}
    ${text}     Get Text    xpath://table[@id='advancedtable']/tbody/tr[3]/td[4]
    Log    ${text}
    # 2,2

Custom Locator Example - WITH using custom locator strategy
    Open Browser    https://letcode.in/advancedtable     chrome
    Maximize Browser Window
    Sleep    5s
    Add Location Strategy    table    My custom keyword for handling tables
    ${text}     Get Text    table:2,2
    Log    ${text}
    ${text}     Get Text    table:3,4
    Log    ${text}

Fetching element from table based on cell value
    Open Browser    https://letcode.in/advancedtable     chrome
    Maximize Browser Window
    Sleep    5s
    ${text}     Get Text    xpath://table[@id='advancedtable']//tr[contains(.,'Dundee')]//td[4]
    Log    ${text}
    Sleep    2s
    ${text}     Get Text    xpath://table[@id='advancedtable']//tr[contains(.,'London')]//td[4]
    Log    ${text}
    Sleep    2s
    Add Location Strategy    table    My custom keyword for finding cell element based on some value in row
    ${text}     Get Text    table:Dundee,4
    Log    ${text}
    Sleep    2s
    ${text}     Get Text    table:London,4
    Log    ${text}
    Sleep    2s


*** Keywords ***
My custom keyword for handling tables
    [Arguments]     ${browser}      ${locator}      ${tag}      ${constraints}
    ${parts}     Split String    ${locator}      ,
    ${elem}     Get WebElement    xpath://table[@id='advancedtable']/tbody/tr[${parts}[0]]/td[${parts}[1]]
    RETURN  ${elem}

My custom keyword for finding cell element based on some value in row
    [Arguments]     ${browser}      ${locator}      ${tag}      ${constraints}
    # locator = text,col_num
    ${parts}     Split String    ${locator}      ,
    ${elem}     Get WebElement    xpath://table[@id='advancedtable']//tr[contains(.,'${parts}[0]')]//td[${parts}[1]]
    RETURN  ${elem}




