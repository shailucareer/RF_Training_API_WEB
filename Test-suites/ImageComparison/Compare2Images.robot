


*** Settings ***
Library     Image_Compartor.py
Library    RequestsLibrary
Library     Image_HighlightDifference.py

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

Compare 2 different images, and highlight the changes
    ${path1}    Set Variable    ${CURDIR}/img1.png
    ${path2}    Set Variable    ${CURDIR}/img2.png
    ${out_img_path}    Set Variable    ${CURDIR}/outimg.png
    Compare Images And Find Difference      ${path1}    ${path2}    ${out_img_path}


Compare 2 different images of app, and find the changes
    ${path1}    Set Variable    ${CURDIR}/images/1.png
    ${path2}    Set Variable    ${CURDIR}/images/2.png
    ${out_img_path}    Set Variable    ${CURDIR}/images/outimg1.png
    ${matching_percentage}     Compare Images And Find Difference      ${path1}    ${path2}    ${out_img_path}


Compare multiple different images of app, and find the changes
    ${path1}    Set Variable    ${CURDIR}/images/1.png
    ${path2}    Set Variable    ${CURDIR}/images/1.png
    ${out_img_path}    Set Variable    ${CURDIR}/images/outimg1.png
    ${matching_percentage}     Compare Images And Find Difference      ${path1}    ${path2}    ${out_img_path}
    Log    ${matching_percentage}
    ${path1}    Set Variable    ${CURDIR}/images/1.png
    ${path2}    Set Variable    ${CURDIR}/images/2.png
    ${out_img_path}    Set Variable    ${CURDIR}/images/outimg2.png
    ${matching_percentage}     Compare Images And Find Difference      ${path1}    ${path2}    ${out_img_path}
    Log    ${matching_percentage}
    ${path1}    Set Variable    ${CURDIR}/images/1.png
    ${path2}    Set Variable    ${CURDIR}/images/3.png
    ${out_img_path}    Set Variable    ${CURDIR}/images/outimg3.png
    ${matching_percentage}     Compare Images And Find Difference      ${path1}    ${path2}    ${out_img_path}
    Log    ${matching_percentage}