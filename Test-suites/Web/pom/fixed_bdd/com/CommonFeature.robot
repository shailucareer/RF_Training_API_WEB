*** Settings ***
Library    SeleniumLibrary
Resource    config.robot


*** Keywords ***

Launch browser bdd
    Open Browser    ${URL}     ${BROWSER}

Close browser bdd
    Close All Browsers