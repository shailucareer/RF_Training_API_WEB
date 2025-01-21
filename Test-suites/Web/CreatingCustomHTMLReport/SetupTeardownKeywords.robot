*** Settings ***
Library    OperatingSystem
Resource    CreateCustomHtmlReport_IntegrateWithRF_TestSuite.robot

*** Keywords ***
Clear older reports
    Remove Directory    ${CUSTOM_REPORT_OUTPUT_DIR}     recursive=True
    Create Directory    ${CUSTOM_REPORT_OUTPUT_DIR}
