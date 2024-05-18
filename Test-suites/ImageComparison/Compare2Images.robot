


*** Settings ***
Library     Image_Compartor.py
Library    RequestsLibrary

*** Test Cases ***
Compare 2 same images
    ${path1}    Set Variable    ${CURDIR}/img1.png
    ${path2}    Set Variable    ${CURDIR}/img1.png
    ${result}   Compare Images    ${path1}    ${path2}

Compare 2 different images
    ${path1}    Set Variable    ${CURDIR}/img1.png
    ${path2}    Set Variable    ${CURDIR}/img2.png
    ${result}   Compare Images    ${path1}    ${path2}

Downlaod image from API - JPEG
    ${response}     GET     https://httpbin.org/image/jpeg
    ${expected_img}    Set Variable    ${CURDIR}/expectedjpeg.jpg
    ${result}   Compare Images Byte   ${response.content}    ${expected_img}
    Should Be Equal    ${True}    ${result}

Downlaod image from API - PNG
    ${response}     GET     https://httpbin.org/image/png
    ${expected_img}    Set Variable    ${CURDIR}/img2.png
    ${result}   Compare Images Byte   ${response.content}    ${expected_img}
    Should Be Equal    ${True}    ${result}

Downlaod image from API - PNG
    ${response}     GET     https://httpbin.org/image/png
    ${expected_img}    Set Variable    ${CURDIR}/img2.png
    ${result}   Compare Images Byte   ${response.content}    ${expected_img}
    Should Be Equal    ${True}    ${result}

Downlaod image from API - WEBP
    ${response}     GET     https://httpbin.org/image/webp
    ${expected_img}    Set Variable    ${CURDIR}/expectedwebp.webp
    ${result}   Compare Images Byte   ${response.content}    ${expected_img}
    Should Be Equal    ${True}    ${result}
