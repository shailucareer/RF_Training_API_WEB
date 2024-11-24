*** Settings ***
Library    FileHandler.py
Library    Collections
Resource    ../config.robot

*** Variables ***
${file_path}        ${CURDIR}/../or/locators.xlsx
${sheet_name}       Sheet1

*** Keywords ***
Load the locator excel file and store its content in a locators dictionary
    ${rowCount}     Get Row Count    ${file_path}    ${sheet_name}

    FOR    ${row}    IN RANGE    0    ${rowCount}
        ${key}     Get Cell Value    ${file_path}    ${sheet_name}    ${row}    1
        ${loc}     Get Cell Value    ${file_path}    ${sheet_name}    ${row}    2

        IF    "${language}"=="en"
             ${val}     Get Cell Value    ${file_path}    ${sheet_name}    ${row}    3
        END

        IF    "${language}"=="fr"
              ${val}     Get Cell Value    ${file_path}    ${sheet_name}    ${row}    4
        END
        
        Log    ${key}/${loc}/${val}

        IF    "${key}"!="${EMPTY}"
            ${locatorStrategyAndValue}     Set Variable      ${loc}:${val}
            Set To Dictionary       ${LOCATORS}     ${key}      ${locatorStrategyAndValue}
        END

       
    END
    Log    ${LOCATORS}
    
    

