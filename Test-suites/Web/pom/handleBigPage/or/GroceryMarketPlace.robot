*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${logo_flipkart_home}       xpath:(//img[@title='Flipkart'])[2]


*** Keywords ***
Take me to Flipkart home
    Wait Until Element Is Visible   ${logo_flipkart_home}
    Click Element    ${logo_flipkart_home}
    Location Should Be    https://www.flipkart.com/