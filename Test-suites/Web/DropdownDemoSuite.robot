*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***

TC1 - Get List Items Demo
    Open Browser    https://letcode.in/dropdowns        chrome
    ${optionsList}     Get List Items    id:fruits
    Log    ${optionsList}
    ${optionsList}     Get List Items    id:fruits      values=True
    Log    ${optionsList}

TC2 - Get Selected List Label
    Open Browser    https://letcode.in/dropdowns        chrome
    Sleep    2s

    # Singleselect dropdown
    ${selectedOption}     Get Selected List Label       id:fruits
    Log    ${selectedOption}
    ${selectedOptionList}     Get Selected List Labels    id:fruits
    Log    ${selectedOptionList}
     ${selectedOption}     Get Selected List Value       id:fruits
    Log    ${selectedOption}
    ${selectedOptionList}     Get Selected List Values    id:fruits
    Log    ${selectedOptionList}

    # Multiselect dropdown
    ${selectedOptionList}     Get Selected List Labels    id:superheros
    Log    ${selectedOptionList}
    ${selectedOptionList}     Get Selected List Values    id:superheros
    Log    ${selectedOptionList}

    # Select a single value from the multiselect dropdown
    #Select All From List    id:fruits
    Select All From List    id:superheros
    ${selectedOption}     Get Selected List Label       id:superheros
    Log    ${selectedOption}
    ${selectedOption}     Get Selected List Value       id:superheros
    Log    ${selectedOption}
    ${selectedOptionList}     Get Selected List Labels    id:superheros
    Log    ${selectedOptionList}
    ${selectedOptionList}     Get Selected List Values    id:superheros
    Log    ${selectedOptionList}


TC3 - List selection should be
    Open Browser    https://letcode.in/dropdowns        headlesschrome
    List Selection Should Be    id:fruits   Select Fruit
    List Selection Should Be    id:fruits   header
    List Selection Should Be    id:superheros
    List Should Have No Selections      id:superheros
    Select From List By Index    id:superheros  0
    List Should Have No Selections      id:superheros


TC4 - Page should contain list
    Open Browser    https://letcode.in/dropdowns        headlesschrome
    Page Should Contain List    id:fruits
    Page Should Not Contain List    id:fruits1
    Page Should Contain List    id:superheros
    Page Should Not Contain List    id:superheros1



TC5 - Select value from list
    Open Browser    https://letcode.in/dropdowns        chrome
    Sleep    2s
    #Set Selenium Speed    1s

    # Singleselect dropdown
    Select From List By Label    id:fruits      Apple
    Select From List By Index    id:fruits      2
    Select From List By Value    id:fruits      3

    #Select From List By Label    id:fruits      apple
    #Select From List By Index    id:fruits      10
    #Select From List By Index    id:fruits      -1

    # Multiselect dropdown
    Select From List By Label    id:superheros      Ant-Man
    Select From List By Index    id:superheros      2
    Select From List By Value    id:superheros      bt



TC6 - UnSelect value from list
    Open Browser    https://letcode.in/dropdowns        chrome
    #Set Selenium Speed    1s

    # Singleselect dropdown
    Select From List By Label    id:fruits      Apple
    Select From List By Index    id:fruits      0

    # Multiselect dropdown
    Select From List By Label    id:superheros      Ant-Man

    #Unselect From List By Label    id:superheros      Ant-Man
    Unselect All From List    id:superheros

TC7 - Select value by partial visible text
    Open Browser    https://letcode.in/dropdowns        chrome
    Sleep    1s
    Capture Page Screenshot
    Select From List By partial label    xpath://select[@id='fruits']    ap
    Sleep    2s
    Capture Page Screenshot
    Select From List By partial label    xpath://select[@id='superheros']    Av
    Sleep    2s

TC8 - Select a value from custom single select dropdown
    Open Browser        https://semantic-ui.com/modules/dropdown.html       chrome
    Sleep    1s
    Select From Custom List By label    (//div[@class='ui selection dropdown']//i[@class='dropdown icon'])[1]    Female
    Select From Custom List By label    (//div[@class='ui dropdown selection']//i[@class='dropdown icon'])[1]    Male
    Select From Custom List By label    (//div[@class='ui fluid selection dropdown']//i[@class='dropdown icon'])[1]    Elliot Fu

TC9 - Select a value from search and select dropdown
    Open Browser        https://semantic-ui.com/modules/dropdown.html       chrome
    Sleep    1s
    Select From Custom Searchable List By label     (//div[@class='ui fluid search selection dropdown']//i[@class='dropdown icon'])[1]      Iran
    Select From Custom Searchable List By label     (//div[@class='ui search dropdown selection']//i[@class='dropdown icon'])[1]            Alaska


TC10 - Select a value from search and select dropdown
    Open Browser        https://semantic-ui.com/modules/dropdown.html       chrome
    Sleep    1s

    Select From Custom Searchable List By label     (//div[contains(@class,'ui fluid search dropdown selection multiple')]//i[@class='dropdown icon'])[1]     Alabama
    Select From Custom Searchable List By label     (//div[contains(@class,'ui fluid search dropdown selection multiple')]//i[@class='dropdown icon'])[1]     Alaska

    # Removing all selected values from multi-select dropdown
    Unselect all from custom search and select list     //div[contains(@class,'ui fluid search dropdown selection multiple')]//a/i
    Sleep    2s

*** Keywords ***

Unselect all from custom search and select list
    [Arguments]     ${locatorXpathOfDeleteIcon}
#    ${deleteElemList}       Get WebElements    //div[contains(@class,'ui fluid search dropdown selection multiple')]//a/i
#    FOR    ${element}    IN    @{deleteElemList}
#        Click Element    ${element}
#    END

    ${bool}     Set Variable        ${True}
    WHILE    ${bool}    limit=NONE
        ${elemList}     Get WebElements    ${locatorXpathOfDeleteIcon}
        ${len}      Get Length    ${elemList}
        IF    ${len}>0
            Click Element    ${elemList[0]}
        ELSE
             ${bool}     Set Variable        ${False}
        END
    END


Select From Custom List By label
    [Arguments]     ${locatorXpath}      ${label}
    Click Element    ${locatorXpath}
    Sleep    1s
    Click Element    //div[contains(@class,'visible')]//div[normalize-space(.)='${label}']
    Sleep    1s


Select From Custom Searchable List By label
    [Arguments]     ${locatorXpath}      ${label}
    Click Element    ${locatorXpath}
    Sleep    1s
    Input Text    //div[contains(@class,'visible')]//input[@class='search']    ${label}
    Sleep    1s
    Press Keys      ${None}     RETURN

Select From List By partial label
    [Arguments]     ${locatorXpath}      ${partialLabel}
    Click Element     ${locatorXpath}
    Sleep    1s
    #Click Element    ${locatorXpath}//option[contains(.,'${partialLabel}')]
    Click Element    ${locatorXpath}////option[contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'${partialLabel}')]
    Sleep    1s
    Click Element     ${locatorXpath}

