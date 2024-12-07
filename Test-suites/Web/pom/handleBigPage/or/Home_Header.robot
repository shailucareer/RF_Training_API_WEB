*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${icon_logo}        xpath://img[@title='Flipkart']
${txt_search}       name:q

*** Keywords ***
Verify logo is present and on click it takes user to home screen
    Wait Until Element Is Visible       ${icon_logo}
    Click Element    ${icon_logo}
    Location Should Be    https://www.flipkart.com/


Verify search field is present and search passed content
    [Arguments]     ${search_data}
    Wait Until Element Is Visible       ${txt_search}
    Input Text    ${txt_search}    ${search_data}
    Press Keys    ${txt_search}     RETURN
    Wait Until Page Contains    results for "${search_data}"