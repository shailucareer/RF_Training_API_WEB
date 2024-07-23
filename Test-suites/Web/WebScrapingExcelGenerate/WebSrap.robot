*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Suite Setup       Set Log Level    WARN

*** Variables ***
${URL}      https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/8308e6d301d54584a33cd04a9861bc52/2c0e7c571fbeb576e10000000a4450e5.html
@{listOfNameUrlClass}
${file_path}    ${CURDIR}/scraped/Home.txt

*** Test Cases ***
Scrap links href and save in txt
    Open Browser    ${URL}  HeadlessChrome
    Maximize Browser Window
    Get href from All links Webelements object
    Nested infinite loop
    Write data into text file

*** keyword ***
Nested infinite loop
    ${flag}     Set Variable    ${True}
    WHILE    ${flag}    limit=NONE
        ${flag}     Set Variable    ${False}
        ${count}    Get Length    ${listOfNameUrlClass}

        FOR    ${index}    IN RANGE    0    ${count}
            Log    *******************************************************
            ${IndividualNameUrlClass}     Set Variable    ${listOfNameUrlClass}[${index}]
#            IF    "${IndividualNameUrlClass[1]}"=="https://help.sap.com/docs/ABAP_PLATFORM_NEW/1a93b7a44ac146b5ad9b6fd95c1223cc/446ad7dbe5254ddee10000000a1553f7.html"
#                ${flag}     Set Variable    ${False}
#                BREAK
#            END

            IF      "${IndividualNameUrlClass[2]}"=="Nested"
                ${flag}     Set Variable    ${True}
                ${TempNameUrlClass}    Get list obj    ${IndividualNameUrlClass[0]}    ${IndividualNameUrlClass[1]}    Done
                Set List Value    ${listOfNameUrlClass}    ${index}    ${TempNameUrlClass}
                Go to       ${IndividualNameUrlClass[1]}
                Get href from All links Webelements object
                Log     ${listOfNameUrlClass}
            END
        END

    END

Get href from All links Webelements object
    TRY
       Expand all
        ${AllLinks}     Get WebElements    xpath:(//ul[@class='tiles'])[1]//a[not(@href='')][@href]
        FOR    ${link}    IN    @{AllLinks}
            ${linktxt}     Get Element Attribute       ${link}     textContent
            ${linktxt}         Process file name    ${linktxt}
            ${class}     Get Element Attribute       ${link}     class
            IF    "${class}" == "o2o"
                ${class}    Set Variable    Nested
            ELSE
                ${class}    Set Variable    Done
            END
            ${href}         Get Element Attribute       ${link}     href
            ${obj}    Get list obj   ${linktxt}    ${href}      ${class}
            Append To List    ${listOfNameUrlClass}     ${obj}
        END
    EXCEPT
        Log    Expand button not found
    END


Write data into text file
    ${path}     Set Variable    ${CURDIR}/scraped/AllScrapedLinks.txt
    Create File     ${path}
    FOR    ${element}    IN    @{listOfNameUrlClass}
        Append To File     ${path}     ${element[0]}\t${element[1]}\t${element[2]}\n
    END

Expand all
    Sleep    4s
    Click Element    xpath://div[@class='maxw']//button[@title='Expand Table of Contents']
    Sleep    1s

Process file name
    [Arguments]     ${data}
    ${data}     Replace String Using Regexp    ${data}    [\\W]+    ${EMPTY}
    RETURN      ${data}
    
Get list obj
    [Arguments]     ${part1}        ${part2}        ${part3}
    @{objlist}      Create List     ${part1}    ${part2}    ${part3}
    RETURN      ${objlist}