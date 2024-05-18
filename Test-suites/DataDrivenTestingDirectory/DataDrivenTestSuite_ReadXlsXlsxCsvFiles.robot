

*** Settings ***
Library     FileHandler.py

*** Test Cases ***
Read xlsx file data
    ${file_loc}     Set Variable    ${CURDIR}/xlsxdata.xlsx
    ${sheet_name}     Set Variable  MonthMapping
    ${data}     Get Row Count    ${file_loc}    ${sheet_name}
    Log    ${data}
    ${data}     Get Column Count    ${file_loc}    ${sheet_name}    0
    Log    ${data}
    ${data}     Get Cell Value    ${file_loc}    ${sheet_name}    0    1
    Log    ${data}
    Set Cell Value    ${file_loc}    ${sheet_name}  0    1    SSR

Read xls file data
    ${file_loc}     Set Variable    ${CURDIR}/xlsdata.xls
    ${sheet_name}     Set Variable  Sheet1
    ${data}     Get Row Count    ${file_loc}    ${sheet_name}
    Log    ${data}
    ${data}     Get Column Count    ${file_loc}    ${sheet_name}    0
    Log    ${data}
    ${data}     Get Cell Value    ${file_loc}    ${sheet_name}    0    1
    Log    ${data}
    Set Cell Value    ${file_loc}    ${sheet_name}  0    1    SSR

Read csv file data
    ${file_loc}     Set Variable    ${CURDIR}/csvdata.csv
    ${sheet_name}     Set Variable  Sheet1
    ${data}     Get Row Count    ${file_loc}    ${sheet_name}
    Log    ${data}
    ${data}     Get Column Count    ${file_loc}    ${sheet_name}    0
    Log    ${data}
    ${data}     Get Cell Value    ${file_loc}    ${sheet_name}    0    1
    Log    ${data}
    Set Cell Value    ${file_loc}    ${sheet_name}  0    1    SSR