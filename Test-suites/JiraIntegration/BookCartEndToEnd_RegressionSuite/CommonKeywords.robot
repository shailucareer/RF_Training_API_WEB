*** Settings ***
Library    RequestsLibrary
Library     JSONLibrary


*** Keywords ***
Custom_Perform login
    [Arguments]     ${BASE_URL}
     # Performed Login
    ${headers}      Create Dictionary   Content-Type=application/json
    ${payload}      Load Json From File    ${CURDIR}/login.json
    ${response}     POST     ${BASE_URL}/api/Login       json=${payload}     headers=${headers}     expected_status=200
    ${json}     Set Variable    ${response.json()}
    ${token}    Set Variable    ${json['token']}
    ${userid}    Set Variable    ${json['userDetails']['userId']}
    RETURN      ${token}    ${userid}

Custom_Delete Wishlist
    [Arguments]     ${BASE_URL}     ${token}    ${userid}
    # Delete the wishlist completely
    ${headers}      Create Dictionary   accept=text/plain   Authorization=bearer ${token}
    ${response}     DELETE    ${BASE_URL}/api/Wishlist/${userid}     headers=${headers}     expected_status=200
    RETURN  ${response}

Custom_Toggle Wishlist
    [Arguments]     ${BASE_URL}     ${token}    ${userid}   ${bookid}
    # Toggle wishlist
    ${headers}      Create Dictionary   accept=text/plain   Authorization=bearer ${token}
    ${response}     POST    ${BASE_URL}/api/Wishlist/ToggleWishlist/${userid}/${bookid}     headers=${headers}
    ${json}     Set Variable    ${response.json()}
    Log    ${json}
    RETURN  ${json}

Custom_Verify Wishlist
    [Arguments]    ${BASE_URL}   ${userid}     ${bookid}
    # Verify wishlist using get call
    ${headers}      Create Dictionary   accept=text/plain
    ${response}     GET    ${BASE_URL}/api/Wishlist/${userid}     headers=${headers}
    ${json}     Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${bookid}    ${json[0]['bookId']}

Custom_Delete Cart
    [Arguments]     ${BASE_URL}     ${userid}
    ${headers}      Create Dictionary   accept=text/plain
    ${response}     DELETE     ${BASE_URL}/api/ShoppingCart/${userid}       headers=${headers}     expected_status=200


Custom_Add Book To Cart
    [Arguments]     ${BASE_URL}     ${userid}   ${bookid}
    ${headers}      Create Dictionary   accept=text/plain
    ${response}     POST     ${BASE_URL}/api/ShoppingCart/AddToCart/${userid}/${bookid}     headers=${headers}     expected_status=200

Custom_Verify Cart Details
    [Arguments]     ${BASE_URL}     ${bookid}   ${userid}
    ${json}     Custom_Get Cart Details     ${BASE_URL}     ${userid}
    Should Be Equal As Numbers    ${bookid}    ${json[0]['book']['bookId']}

Custom_Get Cart Details
    [Arguments]     ${BASE_URL}     ${userid}
    ${headers}      Create Dictionary   accept=text/plain
    ${response}     GET     ${BASE_URL}/api/ShoppingCart/${userid}     headers=${headers}     expected_status=200
    ${json}     Set Variable    ${response.json()}
    RETURN  ${json}


Custom_Get Cart Amount Calculation
    [Arguments]     ${BASE_URL}     ${userid}
    ${headers}      Create Dictionary   accept=text/plain
    ${response}     GET     ${BASE_URL}/api/ShoppingCart/${userid}     headers=${headers}     expected_status=200
    ${json}     Set Variable    ${response.json()}
    ${price}    Set Variable    ${json[0]['book']['price']}
    ${quantity}    Set Variable    ${json[0]['quantity']}
    ${final_amount}     Evaluate    ${price}*${quantity}
    Log    ${final_amount}
    RETURN  ${final_amount}

Custom_Checkout cart
    [Arguments]     ${BASE_URL}     ${json}     ${final_amount}     ${userId}   ${token}
    ${payload}      Create Dictionary       orderDetails=${json}    cartTotal=${final_amount}
    ${headers}      Create Dictionary       accept=text/plain   Content-Type=application/json       Authorization=bearer ${token}
    ${response}     POST    ${BASE_URL}/api/CheckOut/${userId}      json=${payload}     headers=${headers}      expected_status=200