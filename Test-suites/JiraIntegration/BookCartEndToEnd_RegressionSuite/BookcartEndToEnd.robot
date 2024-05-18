*** Settings ***
Resource    CommonKeywords.robot

*** Variables ***
${BASE_URL}     https://bookcart.azurewebsites.net

*** Test Cases ***
SCRUM-T11 Get all book test
    ${response}     GET     ${BASE_URL}/api/Book
    ${json}     Set Variable    ${response.json()}
    Log    ${json}
    ${booktitle}    Set Variable    ${json[0]['title']}
    Log    ${booktitle}
    #Should Be Equal As Strings    ${booktitle}    HP2
    Validate Json By Schema File    ${json}    ${CURDIR}/allbooksSchema.json

SCRUM-T10 Add a book to the Wishlist
    ${bookid}       Set Variable    3
    ${ret_value}    Custom_Perform login    ${BASE_URL}
    ${token}    Set Variable    ${ret_value[0]}
    Log    ${token}
    ${userid}    Set Variable    ${ret_value[1]}
    Custom_Delete Wishlist      ${BASE_URL}    ${token}    ${userid}
    Custom_Toggle Wishlist      ${BASE_URL}    ${token}    ${userid}    ${bookid}
    Custom_Verify Wishlist      ${BASE_URL}    ${userid}    ${bookid}

SCRUM-T9 Add a book to the Cart
    ${bookid}       Set Variable    3
    ${ret_value}    Custom Perform login    ${BASE_URL}
    ${token}    Set Variable    ${ret_value[0]}
    ${userid}    Set Variable    ${ret_value[1]}
    # Delete cart/cleanup cart
    Custom_Delete Cart      ${BASE_URL}      ${userid}
    # Add book to cart
    Custom Add Book To Cart  ${BASE_URL}     ${userid}       ${bookid}
    # verify cart
    Custom Add Book To Cart     ${BASE_URL}     ${userid}       ${bookid}
    # Add same book to cart again
    Custom Verify Cart Details  ${BASE_URL}    ${bookid}    ${userid}
    # Verify the cart amount calculation
    Custom Get Cart Amount Calculation  ${BASE_URL}    ${userid}

SCRUM-T8 Checkout Cart
    ${bookid}       Set Variable    29
     # Performed Login
    ${ret_value}    Custom Perform login    ${BASE_URL}
    ${token}    Set Variable    ${ret_value[0]}
    ${userid}    Set Variable    ${ret_value[1]}
    # Delete cart/cleanup cart
    Custom_Delete Cart  ${BASE_URL}    ${userid}
    # Add book to cart
    Custom_Add Book To Cart     ${BASE_URL}    ${userid}    ${bookid}
    # Add same book to cart again
    Custom_Add Book To Cart     ${BASE_URL}    ${userid}    ${bookid}
    # Verify the cart amount calculation
    ${final_amount}     Custom_Get Cart Amount Calculation      ${BASE_URL}    ${userid}
    ${json}     Custom_Get Cart Details     ${BASE_URL}   ${userid}
    # Checkout cart
    Custom_Checkout cart    ${BASE_URL}    ${json}    ${final_amount}    ${userid}   ${token}

Adding new test case to check in JIRA
    Fail    Failing this test case