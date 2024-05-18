*** Settings ***
Library    Base64ConverterDemo.py
Library    JSONLibrary
Library    RequestsLibrary



*** Variables ***
${BASE_URL_JIRA}        https://dishagangwal31.atlassian.net
# end point /rest/api/3/issue

*** Test Cases ***

Create issue(bug) in JIRA

    ${base64str}     Get Base64 String       dishagangwal31@gmail.com      <APITOKEN>
    ${header}       Create Dictionary       Accept=application/json     Content-Type=application/json       Authorization=Basic ${base64str}
    ${json}         Load Json From File     ${CURDIR}/createissue.json
    ${json}         Update Value To Json    ${json}      $.fields.summary     Session 19 demo bug
    ${response}     POST    ${BASE_URL_JIRA}/rest/api/3/issue   headers=${header}       json=${json}
    ${json_resp}    Set Variable    ${response.json()}
    ${key}          Set Variable    ${json_resp['key']}
    Log    ${key}

    # Attaching the report file to the bug
    ${report_file}     Get File For Streaming Upload    log/log.html
    ${file_header}     Create Dictionary    file=${report_file}
    ${header}       Create Dictionary   Authorization=Basic ${base64str}        Accept=application/json     X-Atlassian-Token=no-check
    ${reponse}      POST        ${BASE_URL_JIRA}/rest/api/3/issue/${key}/attachments        headers=${header}   files=${file_header}

