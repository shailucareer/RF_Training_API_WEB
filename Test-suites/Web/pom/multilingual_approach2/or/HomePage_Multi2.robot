*** Settings ***
Library    SeleniumLibrary
Resource    ../config.robot



*** Keywords ***
Select the Language
        # ${LOCATORS['SelectLanguage_dropdown']}
        Wait Until Element Is Visible   ${LOCATORS['SelectLanguage_dropdown']}
        Click Element    ${LOCATORS['SelectLanguage_dropdown']}
        Sleep    1s
        Click Element    ${LOCATORS['Language_option']}


Verify the navigation links
        Element Should Be Visible    ${LOCATORS['Products_link']}
        Element Should Be Visible    ${LOCATORS['Solutions_link']}
        Element Should Be Visible    ${LOCATORS['Developer_link']}

