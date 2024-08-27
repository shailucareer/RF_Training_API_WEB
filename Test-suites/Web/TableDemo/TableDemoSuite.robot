*** Settings ***
Library    SeleniumLibrary




*** Test Cases ***
TC1 - Get Table Cell Demo
    Open Browser    https://letcode.in/table    chrome
    Sleep    2s
    Maximize Browser Window
    ${val}     Get Table Cell    id:shopping    3    1
    Log    ${val}
    Should Contain    ${val}    Apple

TC2 - Table Cell Should Contain Demo
    Open Browser    https://letcode.in/table    chrome
    Sleep    2s
    Maximize Browser Window
    Table Cell Should Contain    id:shopping    3    1      Apple

TC3 - Table Header Should Contain Demo
    Open Browser    https://letcode.in/table    headlesschrome
    Maximize Browser Window
    Table Header Should Contain    id:shopping    Price

TC4 - Table Footer Should Contain Demo
    Open Browser    https://letcode.in/table    headlesschrome
    Maximize Browser Window
    Table Footer Should Contain    id:shopping    Total

TC5 - Table Should Contain and Table Row should contain Demo
    Open Browser    https://letcode.in/table    headlesschrome
    Maximize Browser Window
    ${data}     Get Table Cell    id:shopping    2    1
    Table Row Should Contain    id:shopping     1   late
    Table Should Contain    id:shopping    Eggs

Custom keywords Demo
    Open Browser    https://letcode.in/table    headlesschrome
    ${rowcount}     Get Table Row Count     //table[@id='shopping']
    Log    ${rowcount}
    ${rowcount}     Get Table Row Count     //table[@id='simpletable']
    Log    ${rowcount}
    ${rowcount}     Get Table Row Count     //table[@matsort]
    Log    ${rowcount}

Custom keywords Demo2
    Open Browser    https://the-internet.herokuapp.com/tables    headlesschrome
    ${colcount}     Get Table Column Count  //table[@id='table1']     1
    Log    ${colcount}

Custom keywords Demo3
    Open Browser    https://the-internet.herokuapp.com/tables    headlesschrome
    ${CellElem}     Get Table Cell Element    //table[@id='table1']    1    1
    Capture Page Screenshot
    Click Element    ${CellElem}
    Capture Page Screenshot

Custom keywords Demo4
    Open Browser    https://the-internet.herokuapp.com/tables    chrome
    Sleep    3s
    ${EditElem}     Get Table Cell Child Element    //table[@id='table1']    2    6    a    1
    Click Element    ${EditElem}
    Sleep    2s
    ${DelElem}     Get Table Cell Child Element    //table[@id='table1']    2    6    a    2
    Click Element    ${DelElem}
    Sleep    2s


Custom keywords Demo5
    Open Browser    https://the-internet.herokuapp.com/tables    headlesschrome
    ${RowNum}   Get Table Row With Cell Text        //table[@id='table1']       timmy
    Log    ${RowNum}

Get Grid Row Count Demo
    Open Browser    https://getbootstrap.com/docs/4.2/layout/grid/    headlesschrome
    ${rowNum}       Get Grid Row With Cell Text    (//div[@class='container'])[7]    col
    Log    ${rowNum}
    ${rowcount}     Get Grid Row Count      (//div[@class='container'])[4]
    Log    ${rowcount}
    ${rowcount}     Get Grid Row Count      (//div[@class='container'])[9]
    Log    ${rowcount}
    ${rowcount}     Get Grid Column Count      (//div[@class='container'])[4]      1
    Log    ${rowcount}
    ${rowcount}     Get Grid Column Count      (//div[@class='container'])[7]      1
    Log    ${rowcount}
    ${rowcount}     Get Grid Column Count      (//div[@class='container'])[7]      2
    Log    ${rowcount}

*** Keywords ***
Private Get Table or Grid Row Count
    [Arguments]     ${TableOrGrid}       ${TableLocatorXpath}
    IF    "${TableOrGrid}"=="TABLE"
        ${elems}    Get WebElements    ${TableLocatorXpath}//tr
    ELSE
        ${elems}    Get WebElements    ${TableLocatorXpath}/div[@class='row']
    END
    ${rowcount}     Get Length    ${elems}
    RETURN  ${rowcount}

Get Table Row Count
    [Arguments]     ${TableLocatorXpath}
    ${rowcount}     Private Get Table or Grid Row Count    TABLE    ${TableLocatorXpath}
    RETURN  ${rowcount}

Get Grid Row Count
    [Arguments]     ${TableLocatorXpath}
    ${rowcount}     Private Get Table or Grid Row Count    GRID    ${TableLocatorXpath}
    RETURN  ${rowcount}

Private Get Table or Grid Column Count
    [Arguments]     ${TableOrGrid}       ${TableLocatorXpath}          ${row}
    IF    "${TableOrGrid}"=="TABLE"
        ${elems}    Get WebElements    (${TableLocatorXpath}//tr)[${row}]//td | (${TableLocatorXpath}//tr)[${row}]//th
    ELSE
         ${elems}    Get WebElements    ${TableLocatorXpath}/div[@class='row'][${row}]/div[contains(@class,'col')]
    END
    ${colcount}     Get Length    ${elems}
    RETURN  ${colcount}
    
Get Grid Column Count
    [Arguments]     ${TableLocatorXpath}    ${row}
    ${colcount}     Private Get Table or Grid Column Count    GRID    ${TableLocatorXpath}       ${row}
    RETURN  ${colcount}

Get Table Column Count
    [Arguments]     ${TableLocatorXpath}    ${row}
    ${colcount}     Private Get Table or Grid Column Count    TABLE    ${TableLocatorXpath}       ${row}
    RETURN  ${colcount}

Get Table Cell Element
    [Arguments]     ${TableLocatorXpath}    ${row}      ${col}
    ${CellWebElem}      Get WebElement    (${TableLocatorXpath}//tr)[${row}]//td[${col}] | (${TableLocatorXpath}//tr)[${row}]//th[${col}]
    RETURN      ${CellWebElem}

Get Table Cell Child Element
    [Arguments]     ${TableLocatorXpath}    ${row}      ${col}      ${ChildElemTag}     ${ChildElemPosition}
    #((${TableLocatorXpath}//tr)[${row}]//td[${col}]//${ChildElemTag})[${ChildElemPosition}]
    ${CellWebElem}      Get WebElement    ((${TableLocatorXpath}//tr)[${row}]//td[${col}]//${ChildElemTag})[${ChildElemPosition}] | ((${TableLocatorXpath}//tr)[${row}]//th[${col}]//${ChildElemTag})[${ChildElemPosition}]
    RETURN      ${CellWebElem}


Private Get Grid or Table Row With Cell Text
    [Arguments]     ${TableOrGrid}     ${TableLocatorXpath}     ${CellText}
    IF    "${TableOrGrid}"=="TABLE"
        ${rowlen}       Get Table Row Count     ${TableLssocatorXpath}
    ELSE
        ${rowlen}       Get Grid Row Count     ${TableLocatorXpath}
    END

    FOR    ${counter}    IN RANGE    1    ${rowlen}+1
        TRY
            IF    "${TableOrGrid}"=="TABLE"
                ${txt}      Get Text    (${TableLocatorXpath}//tr)[${counter}]
            ELSE
                ${txt}      Get Text    ${TableLocatorXpath}/div[@class='row'][${counter}]
            END
           Should Contain    ${txt}    ${CellText}
           RETURN   ${counter}
        EXCEPT
            Log    ${None}
        END
    END
    RETURN  -1

Get Grid Row With Cell Text
    [Arguments]     ${TableLocatorXpath}    ${CellText}
    ${rowcount}     Private Get Grid or Table Row With Cell Text    GRID    ${TableLocatorXpath}        ${CellText}
    RETURN      ${rowcount}

Get Table Row With Cell Text
    [Arguments]     ${TableLocatorXpath}    ${CellText}
    ${rowcount}     Private Get Grid or Table Row With Cell Text    TABLE    ${TableLocatorXpath}        ${CellText}
    RETURN      ${rowcount}