*** Settings ***
Library     OperatingSystem
Library    Collections
Library    String
Resource    SetupTeardownKeywords.robot


Suite Setup         Clear older reports
Suite Teardown      Create Custom HTML Report
Test Teardown       End test

*** Variables ***
${HTML_STATIC_CONTENT_HEADER}     <html> <head> <title>Custom HTML Report</title> </head> <body> <h1> My Custom HTML Report</h1> <table border="1"> <tr> <th>Test Name</th> <th>Status</th>  <th>Step Desc</th>   <th>Screenshot link</th> </tr>
${HTML_STATIC_CONTENT_FOOTER}     </table> </body> </html>
&{TEST_RESULTS}
@{ROWS}
${CUSTOM_REPORT_OUTPUT_DIR}         ${CURDIR}/report


*** Keywords ***

End test
    ${json_data}    Evaluate    json.dumps('''${TEST_RESULTS}''')   json
    Create File    ${CUSTOM_REPORT_OUTPUT_DIR}/${TEST_NAME}.json    ${json_data}

Create Custom HTML Report
    Log    ${TEST_RESULTS}
    Log    Creating a custom html report

    # Read the individual tests json and combine them to create final report
    ${all_results}    Create Dictionary
    ${files}    List Files In Directory    ${CUSTOM_REPORT_OUTPUT_DIR}
    FOR    ${file}    IN    @{files}
        ${test_results}    Get File    ${CUSTOM_REPORT_OUTPUT_DIR}/${file}
        ${test_results}=    Replace String    ${test_results}    "    ${EMPTY}
        ${test_results}=    Replace String    ${test_results}    '    "
        ${test_results}    Evaluate    json.loads('''${test_results}''')    json
        Log    ${TEST_RESULTS}

        ${keys}     Get Dictionary Keys    ${TEST_RESULTS}
        FOR    ${key}    IN    @{keys}
            @{value}    Get From Dictionary    ${test_results}    ${key}
            Set To Dictionary    ${all_results}    ${key}=${value}
        END
        Log    ${all_results}
    END


    ${DYNAMIC_CONTENT}      Set Variable    ${EMPTY}
    ${keylist}      Get Dictionary Keys    ${all_results}
    FOR    ${key_tc_name}    IN    @{keylist}
        ${DYNAMIC_CONTENT}      Set Variable        ${DYNAMIC_CONTENT}<tr> <td>${key_tc_name}</td> <td></td> <td></td> <td></td> </tr>
        ${step_list}        Get From Dictionary    ${all_results}    ${key_tc_name}
        FOR    ${step_row}    IN    @{step_list}
             ${DYNAMIC_CONTENT}      Set Variable        ${DYNAMIC_CONTENT}<tr> <td></td> <td>${step_row[0]}</td> <td>${step_row[1]}</td> <td></td> </tr>
         END
    END
    ${HTML_CONTENT_DYNAMIC}     Set Variable    ${HTML_STATIC_CONTENT_HEADER} ${DYNAMIC_CONTENT} ${HTML_STATIC_CONTENT_FOOTER}
    Create File    ${CUSTOM_REPORT_OUTPUT_DIR}/DynamicReport.html       ${HTML_CONTENT_DYNAMIC}


Custom Report Add Test Case
    Set To Dictionary       ${TEST_RESULTS}     ${TEST_NAME}=@{ROWS}

Custom Report Report Info
    [Arguments]     ${step_desc}
    ${TEMP_LIST}        Create List     INFO    ${step_desc}
    ${existing_items}   Get From Dictionary    ${TEST_RESULTS}    ${TEST_NAME}
    Append To List    ${existing_items}     ${TEMP_LIST}
    Set To Dictionary    ${TEST_RESULTS}        ${TEST_NAME}=${existing_items}

Custom Report Report Pass
    [Arguments]     ${step_desc}
    ${TEMP_LIST}        Create List     PASS    ${step_desc}
    ${existing_items}   Get From Dictionary    ${TEST_RESULTS}    ${TEST_NAME}
    Append To List    ${existing_items}     ${TEMP_LIST}
    Set To Dictionary    ${TEST_RESULTS}        ${TEST_NAME}=${existing_items}

Custom Report Report Fail
    [Arguments]     ${step_desc}
    ${TEMP_LIST}        Create List     FAIL    ${step_desc}
    ${existing_items}   Get From Dictionary    ${TEST_RESULTS}    ${TEST_NAME}
    Append To List    ${existing_items}     ${TEMP_LIST}
    Set To Dictionary    ${TEST_RESULTS}        ${TEST_NAME}=${existing_items}


*** Test Cases ***
TC1.1.1
    Custom Report Add Test Case
    Log    Tc1 log
    Custom Report Report Info   My Step Desc1.1
    Custom Report Report Pass   My Step Desc1.2
    Custom Report Report Fail   My Step Desc1.3

TC2.1
    Custom Report Add Test Case
    Log    Tc2 log
    Custom Report Report Info   My Step Desc1
    Custom Report Report Pass   My Step Desc2
    Custom Report Report Fail   My Step Desc3
#TC3.1
#    Custom Report Add Test Case
#    Log    Tc3 log
#    Custom Report Report Info   My Step Desc1
#    Custom Report Report Pass   My Step Desc2
#    Custom Report Report Fail   My Step Desc3
#TC4.1
#    Custom Report Add Test Case
#    Log    Tc3 log
#    Custom Report Report Info   My Step Desc1
#    Custom Report Report Pass   My Step Desc2
#    Custom Report Report Fail   My Step Desc3
#TC5.1
#    Custom Report Add Test Case
#    Log    Tc3 log
#    Custom Report Report Info   My Step Desc1
#    Custom Report Report Pass   My Step Desc2
#    Custom Report Report Fail   My Step Desc3