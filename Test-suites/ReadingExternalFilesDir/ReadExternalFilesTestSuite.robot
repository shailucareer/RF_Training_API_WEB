

*** Settings ***
Library     JSONLibrary
Variables   ${CURDIR}/data.yaml
Library     OperatingSystem


*** Test Cases ***
Reading and printing the json file data
    ${jsondata}     Load Json From File    ${CURDIR}/data.json
    Log    ${jsondata}

Reading and printing the yml file data
    Log    ${stringKey}
    Log    ${listKey[1]}
    Log    ${dictKey['one']}

Reading and printing the data from txt file
    ${txtdata}    Get File    ${CURDIR}/data.txt
    Log    ${txtdata}