*** Settings ***
Library    RequestsLibrary
Library    Base64ConverterDemo.py


*** Test Cases ***

HTTP auth demo - Basic Auth
    ${BASE_URL}     Set Variable    https://httpbin.org
    ${USERNAME}     Set Variable    path
    ${PASSWORD}     Set Variable    path
    ${BASE64STR}    Get Base64 String    ${USERNAME}     ${PASSWORD}
    ${HEADER}       Create Dictionary   accept=application/json     Authorization=Basic ${BASE64STR}
    ${response}     GET     ${BASE_URL}/basic-auth/user/passwd      headers=${HEADER}


HTTP auth demo - Digest Auth
    ${BASE_URL}     Set Variable    https://httpbin.org
    ${USERNAME}     Set Variable    path
    ${PASSWORD}     Set Variable    path
    ${HEADER}       Create Dictionary   accept=application/json     Authorization=Digest username="path", realm="me@kennethreitz.com", nonce="aeee71c46e84aad57714d8106407ca5c", uri="/digest-auth/auth/path/path", algorithm="MD5", qop=auth, nc=00000001, cnonce="18ItkT4H", response="89d33370cd064b8700fbc46cb79fb68c", opaque="bf1e76bcd7d167f7d02eee6952aa5bfd"
    ${response}     GET     ${BASE_URL}/digest-auth/auth/${USERNAME}/${PASSWORD}      headers=${HEADER}

Session based auth
    ${BASE_URL}     Set Variable    https://restful-booker.herokuapp.com
    ${PAYLOAD_BODY}     Create Dictionary   username=admin  password=password1234
    ${HEADERS}          Create Dictionary   Content-Type=application/json
    ${response}     POST    ${BASE_URL}/auth    json=${PAYLOAD_BODY}    headers=${HEADERS}
    Status Should Be    200
    ${json_body}    Set Variable    ${response.json()}
    Log     ${json_body}
    Should Not Be Empty    ${json_body['token']}

