*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
#Library     FileHandler.py

*** Variables ***
${URL}      https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/8308e6d301d54584a33cd04a9861bc52/2c0e7c571fbeb576e10000000a4450e5.html
@{listOfObj}

*** Test Cases ***
Scrap links href and save in txt
    ${file_path}    Set Variable    ${CURDIR}/scraped/Home.txt
    Open Browser    ${URL}  HeadlessChrome
    Maximize Browser Window
    Expand all
    ${AllLinks}     Get WebElements    xpath:(//ul[@class='tiles'])[1]//a[not(@href='')][@href]

    Get href from All links Webelements object      ${AllLinks}

    ${flag}     Set Variable    ${True}
    WHILE    ${flag}    limit=NONE
        ${flag}     Set Variable    ${False}
        ${count}    Get Length    ${listOfObj}
        FOR    ${index}    IN RANGE    0    ${count}
            Log    *******************************************************
            ${part}     Set Variable    ${listOfObj}[${index}]
            #Log    ${part[0]}
            #Log    ${part[1]}
            #Log    ${part[2]}
            IF      "${part[2]}"=="Nested"
                ${flag}     Set Variable    ${True}
                ${obj}    Get list obj    ${part[0]}    ${part[1]}    Done
                Set List Value    ${listOfObj}    ${index}    ${obj}
                TRY
                    Go to       ${part[1]}
                    Expand all
                    ${AllSubLinks}     Get WebElements    xpath:(//ul[@class='tiles'])[1]//a[not(@href='')][@href]
                    Get href from All links Webelements object      ${AllSubLinks}
                EXCEPT
                        Log    Expand button not found
                END
                Log     ${listOfObj}
            END

        END

    END
    Write data into text file

*** keyword ***
Get href from All links Webelements object
    [Arguments]     ${AllLinks}
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
        Append To List    ${listOfObj}     ${obj}
    END


Scrap Child page links href and save in txt
    ${counter}      Set Variable        0
        Create File     ${file_path}
        FOR    ${link}    IN    @{AllLinks}
            ${href}     Get Element Attribute       ${link}     href
            ${class}     Get Element Attribute       ${link}     class
            IF    "${class}" == "o2o"
                ${class}    Set Variable    Nested
            ELSE
                ${class}    Set Variable    Final
            END
            Append To File      ${file_path}      HomePage\t${href}\t${class}\n
            #Set Cell Value    ${CURDIR}/Scrape.xlsx    Sheet1    ${counter}    0    HomePage
            #Set Cell Value    ${CURDIR}/Scrape.xlsx    Sheet1    ${counter}    1    ${href}
            ${counter}      Evaluate    ${counter}+1
        END

    Open Browser    ${URL}  HeadlessChrome
    Maximize Browser Window
    Expand all
    # Nested links of Home Page
    ${AllLinksSubPage}     Get WebElements    xpath:(//ul[@class='tiles'])[1]//span[@title='Navigate to related document']/..
    &{AllLinksHref}     Create Dictionary
    FOR    ${link}    IN    @{AllLinksSubPage}
        ${linktxt}     Get Element Attribute       ${link}     textContent
        ${data}         Process file name    ${linktxt}
        ${href}         Get Element Attribute       ${link}     href
        Set To Dictionary      ${AllLinksHref}     ${data}       ${href}
    END
    #Log  ${AllLinksHref}
    ${DictionaryKeys}   Get Dictionary Keys     ${AllLinksHref}
    ${counter}      Set Variable        0
    FOR    ${key}    IN    @{DictionaryKeys}
        Go to       ${AllLinksHref}[${key}]
        Expand all
        ${AllLinksChild}     Get WebElements    xpath:(//ul[@class='tiles'])[1]//a[not(@href='')][@href]

        ${file_path}    Set Variable    ${CURDIR}/scraped/${key}.txt

        Create File     ${file_path}
        FOR    ${link}    IN        @{AllLinksChild}
            ${href}         Get Element Attribute       ${link}     href
            Append To File      ${file_path}      ${key}\t${href}\n
        END

        ${counter}      Evaluate    ${counter}+1
        IF  ${counter}==2   BREAK

    END


Manipulating list of obj test
    ${obj}    Get list obj   HomePage    https://www.google.com1      Nested
    Append To List    ${listOfObj}     ${obj}
    ${obj}    Get list obj   HomePage    https://www.google.com2      Done
    Append To List    ${listOfObj}     ${obj}
    ${obj}    Get list obj   HomePage    https://www.google.com3      Nested
    Append To List    ${listOfObj}     ${obj}
    Log     ${listOfObj}
    ${count}    Get Length    ${listOfObj}
#    FOR    ${index}    IN RANGE    0    ${count}
#        Log    *******************************************************
#        ${part}     Set Variable    ${listOfObj}[${index}]
#        Log    ${part[0]}
#        Log    ${part[1]}
#        Log    ${part[2]}
#        IF      "${part[2]}"=="Nested"
#            ${obj}    Get list obj    ${part[0]}    ${part[1]}    Done
#            Set List Value    ${listOfObj}    ${index}    ${obj}
#        END
#        Log     ${listOfObj}
#
#    END
#    Log     ${listOfObj}

    ${flag}     Set Variable    ${True}
    WHILE    ${flag}    limit=NONE
        ${flag}     Set Variable    ${False}
        ${count}    Get Length    ${listOfObj}
        FOR    ${index}    IN RANGE    0    ${count}
            Log    *******************************************************
            ${part}     Set Variable    ${listOfObj}[${index}]
            #Log    ${part[0]}
            #Log    ${part[1]}
            #Log    ${part[2]}
            IF      "${part[2]}"=="Nested"
                ${flag}     Set Variable    ${True}
                ${obj}    Get list obj    ${part[0]}    ${part[1]}    Done
                Set List Value    ${listOfObj}    ${index}    ${obj}
                Log     ${listOfObj}
            END

        END

    END
    Write data into text file


Write data into text file
    ${path}     Set Variable    ${CURDIR}/scraped/AllScrapedLinks.txt
    Create File     ${path}
    FOR    ${element}    IN    @{listOfObj}
        Append To File     ${path}     ${element[0]}\t${element[1]}\t${element[2]}\n
    END
#    Append To File      ${CURDIR}/Home.txt      HomePage\thttps:1.html\n
#    Append To File      ${CURDIR}/Home.txt      HomePage\thttps:2.html\n
#    Append To File      ${CURDIR}/Home.txt      HomePage\thttps:3.html\n

Expand all
    Sleep    4s
    Click Element    xpath://div[@class='maxw']//button[@title='Expand Table of Contents']
    Sleep    1s

Process file name
    [Arguments]     ${data}
    ${data}     Replace String Using Regexp    ${data}    [\\W]+    ${EMPTY}
    #${data}     Replace String      ${data}     /   ${EMPTY}
    #${data}     Replace String      ${data}     ${SPACE}   ${EMPTY}
    RETURN      ${data}
    
Get list obj
    [Arguments]     ${part1}        ${part2}        ${part3}
    @{objlist}      Create List     ${part1}    ${part2}    ${part3}
    RETURN      ${objlist}