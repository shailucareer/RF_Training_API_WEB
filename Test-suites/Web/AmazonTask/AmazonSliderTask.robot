
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       chrome
${URL}           https://www.amazon.in/s?k=tshirt+for+men&i=todays-deals&crid=1YWID6URU1UTP&sprefix=%2Ctodays-deals%2C201&ref=nb_sb_ss_recent_1_0_recent
${SLIDER}        xpath://div[@class='a-section s-range-input-container s-lower-bound aok-relative']/input[contains(@type,'range')]
${GO}            xpath://input[@aria-label='Go - Submit price range']

*** Test Cases ***
Automate Range Slider
    [Documentation]   Test case to automate range slider.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    #Set Slider Value    ${SLIDER}    100
    Set Slider Value Simple    100
    Sleep    5s
    Set Slider Value Simple    300
    Sleep    5s
    Set Slider Value Simple    500
    Sleep    5s
    Set Slider Value Simple    1000
    Sleep    5s
    Close Browser

*** Keywords ***
Set Slider Value Simple
    [Arguments]    ${value}
    Execute Javascript      document.getElementsByName("low-price")[0].setAttribute("value","${value}")
    Click Element    ${GO}


Set Slider Value
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}
    Set Focus To Element    ${locator}
    Execute JavaScript    window.scrollTo(0, arguments[0].getBoundingClientRect().top + window.scrollY - (window.innerHeight / 2));    ${locator}
    Execute JavaScript    var slider = arguments[0]; slider.value = arguments[1]; slider.dispatchEvent(new Event('input', { bubbles: true }));    ${locator}    ${value}
    Sleep    1s