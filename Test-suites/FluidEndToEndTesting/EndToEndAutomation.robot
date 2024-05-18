*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     JSONLibrary
Library     DatabaseLibrary

*** Variables ***
${BASE_URL}     https://bookcart.azurewebsites.net


*** Test Cases ***

Db connect
    Connect To Database     pymysql    sakila    root    root    127.0.0.1    3306  alias=sakiladb
    ${result}   Query    select * from actor;
    Log    ${result}
    Log    ${result[0][0]}
    Log    ${result[0][1]}
    Log    ${result[0][2]}
    Log    ${result[0][3]}
    Connect To Database     pymysql    world    root    root    127.0.0.1    3306   alias=worlddb
    ${result}   Query    select * from country;
    Log    ${result}
    Log    ${result[0][0]}
    Log    ${result[0][1]}
    Log    ${result[0][2]}
    Log    ${result[0][3]}
    Disconnect From Database    alias=sakiladb
    Disconnect From Database    alias=worlddb



Fluid - End to end test case transitioning from API to Web
    ${bookid}       Set Variable    18

    # Performed Login
    ${result}    API Login
    ${token}   Set Variable     ${result[0]}
    ${userid}   Set Variable    ${result[1]}

    # Delete the wishlist completely
    API Delete wishlist    ${token}    ${userid}

    # Toggle wishlist
    API Toggle wishlist    ${token}    ${userid}    ${bookid}
    
    # Verify wishlist using get call
    ${bookName}     API Verify wishlist    ${token}    ${userid}    ${bookid}

    # Verify wishlist using selenium
    Web Verify book added in wishlist    ${bookName}

*** Keywords ***
API Login
    ${headers}      Create Dictionary   Content-Type=application/json
    ${payload}      Load Json From File    ${CURDIR}/login.json
    ${response}     POST     ${BASE_URL}/api/Login       json=${payload}     headers=${headers}     expected_status=200
    ${json}     Set Variable    ${response.json()}
    ${token}    Set Variable    ${json['token']}
    ${userid}    Set Variable    ${json['userDetails']['userId']}
    [Return]    ${token}    ${userid}

Web Verify book added in wishlist
    [Arguments]     ${bookName}
    # Open browser and login to verify the wishlist
    Open Browser    ${BASE_URL}     chrome
    Click Element    xpath://button[.='Login']
    Input Text    id:mat-input-0    appychip
    Input Text    id:mat-input-1    Test@123
    Click Element    xpath://form//button[.='Login']
    Sleep    2s
    Click Element    xpath://button[contains(.,'favorite')]
    Element Should Be Visible    link:${bookName}

API Delete wishlist
    [Arguments]     ${token}    ${userid}
    ${headers}      Create Dictionary   accept=text/plain   Authorization=bearer ${token}
    ${response}     DELETE    ${BASE_URL}/api/Wishlist/${userid}     headers=${headers}     expected_status=200

API Toggle wishlist
    [Arguments]     ${token}    ${userid}   ${bookid}
    ${headers}      Create Dictionary   accept=text/plain   Authorization=bearer ${token}
    ${response}     POST    ${BASE_URL}/api/Wishlist/ToggleWishlist/${userid}/${bookid}     headers=${headers}
    ${json}     Set Variable    ${response.json()}
    Log    ${json}

API Verify wishlist
    [Arguments]     ${token}    ${userid}   ${bookid}
    ${headers}      Create Dictionary   accept=text/plain
    ${response}     GET    ${BASE_URL}/api/Wishlist/${userid}     headers=${headers}
    ${json}     Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${bookid}    ${json[0]['bookId']}
    [Return]    ${json[0]['title']}
