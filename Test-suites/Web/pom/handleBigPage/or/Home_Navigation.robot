*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${link_grocery}     xpath://a[@aria-label='Grocery']
${link_mobiles}     xpath://a[@aria-label='Mobiles']


*** Keywords ***
Click on Grocery link and verify the navigation
    Wait Until Element Is Visible       ${link_grocery}
    Click Element    ${link_grocery}
    Location Should Contain    marketplace=GROCERY

Click on Mobiles link and verify the navigation
    Wait Until Element Is Visible       ${link_grocery}
    Click Element    ${link_grocery}
    Location Should Contain    marketplace=GROCERY