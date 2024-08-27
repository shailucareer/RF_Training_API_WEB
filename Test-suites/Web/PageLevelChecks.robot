*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1, checkbox hide/unhide
    Open Browser        https://the-internet.herokuapp.com/dynamic_controls     chrome
    Page Should Contain    Dynamic Controls
    Page Should Contain Checkbox    xpath://input[@label='blah']
    Page Should Contain Button    xpath://button[.='Remove']
    Click Button    xpath://button[.='Remove']
    Wait Until Element Is Not Visible    id:loading
    Page Should Not Contain Checkbox    xpath://input[@label='blah']


TC2, textfield enable/disable
    Open Browser        https://the-internet.herokuapp.com/dynamic_controls     chrome
    Page Should Contain    Dynamic Controls
    Page Should Contain Textfield    xpath://form[@id='input-example']/input
    Element Should Be Disabled    xpath://form[@id='input-example']/input
    Click Button    xpath://button[.='Enable']
    Wait Until Element Is Not Visible    id:loading
    Element Should Be Enabled    xpath://form[@id='input-example']/input
    Sleep    2s

