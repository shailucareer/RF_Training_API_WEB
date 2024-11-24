*** Settings ***
Library    SeleniumLibrary
Resource    ../config.robot
Resource    locators_${language}.robot


*** Keywords ***
Select the Language
        Wait Until Element Is Visible   ${SelectLanguage_dropdown}
        Click Element    ${SelectLanguage_dropdown}
        Sleep    1s
        IF    "${language}" == "en"
             Click Element    xpath://a[contains(.,'English')]
        END

        IF    "${language}" == "fr"
             Click Element    xpath://a[contains(.,'Français')]
        END



Verify the navigation links
        Element Should Be Visible    ${Products_link}
        Element Should Be Visible    ${Solutions_link}
        Element Should Be Visible    ${Developer_link}

