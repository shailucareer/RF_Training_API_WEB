*** Settings ***
Library    String
Library    XML
Resource    VariablesCommon.robot

*** Variables ***
${BASE_URL}     https://mybaseurl.com
@{GLOBAL_LIST}  Red     Black   Orange  Pink
&{GLOBAL_DICT}  Content-Type=text/json      Authorization=Bearer token value
${ENV}      DEV

*** Keywords ***
My keyword 1
    ${v1}   Set Variable    Hello
    Log    ${v1}



*** Test Cases ***

Precedence and Scope
    Log    ${ENV}
    ${ENV}  Set Variable      PROD
    Log    ${ENV}


Builtin/Runtime Varible Demo
    Log    ${ENV} ${BROWSER}
    Log    ${CURDIR}
    Log    ${LOG_FILE}

Date manipulation
    ${v1}   Evaluate    datetime.date.today()
    Log    ${v1}
    ${v2}   Evaluate    datetime.date.today() + datetime.timedelta(7)
    Log    ${v2}
    ${v2}   Evaluate    datetime.date.today() + datetime.timedelta(-14)
    Log    ${v2}

    # inline evaluation
    ${inline_eval}      Set Variable    ${{datetime.date.today() + datetime.timedelta(-14)}}
    Log    ${inline_eval}

Type conversion from string to number
    ${v1}   Set Variable    '5.512'
    ${v1}   Replace String    ${v1}    '    ${EMPTY}
    ${v2}   Convert To Number    ${v1}
    ${v3}   Evaluate    ${v2} + 10
    Log    ${v3}


Generate Random Number Demo
    # EMAIL = varsha@reqres.com
    # part 1 = varsha
    # part 2 = @reqres.com
    ${email_part1}  Set Variable    varsha
    ${email_part2}  Set Variable    @reqres.com

    ${random_number}    Generate Random String      4   [NUMBERS]
    Log    ${random_number}

    ${final_email}  Set Variable    ${email_part1}${random_number}${email_part2}
    Log     ${final_email}


Dictionary Variable - Demo
    # KEY : VALUE
    # KEY is always String, can not be null, blank
    # VALUE can be Numeric, String, Boolean, List, Dictionary, Oject
    ${dict_name}    Create Dictionary   email=varsha@reqres.com     passwd=Test123
    Log    ${dict_name}
    &{dict_name}    Create Dictionary   Content-Type=text/json      Authorization=Bearer token value
    Log    ${dict_name}
    Log    ${GLOBAL_DICT}
    Log    ${GLOBAL_DICT.Authorization}

List Variable - Demo
    ${list_name}    Create List    1    2   3   4
    Log    ${list_name}
    @{list_name}    Create List     Apple   Banana  Orange
    Log    ${list_name}
    # Won't work
    #Log    @{list_name}
    Log    ${GLOBAL_LIST}
    # Log     Get Length    ${GLOBAL_LIST}
    #Log    Evaluate     len()
    Log    ${GLOBAL_LIST[0]}
    
    

Scalar Variable - Type Demo
    ${var}      Set Variable    Hello World
    Log    ${var}

    ${var}      Set Variable    ${var}${SPACE}Shailendra
    Log    ${var}

    ${var}      Set Variable    1
    Log    ${var}
    ${var}      Set Variable    1.2
    Log    ${var}
    ${var}      Set Variable    ${True}
    Log    ${var}
    ${var}      Set Variable    ${False}
    Log    ${var}
    Log    ${BASE_URL}
    ${var}      Set Variable    ${None}
    Log    ${var}
    ${var}      Set Variable    ${null}
    Log    ${var}
    ${var}      Set Variable    ${SPACE}
    Log    ${var}
    ${var}      Set Variable    ${EMPTY}
    Log    ${var}
    
    Log    %{path}
    


Scalar Variable - Calc Demo
    ${v1}   Set Variable    5
    ${v2}   Set Variable    2
    ${result}   Evaluate    ${v1} + ${v2}
    Log    ${result}
    ${result}   Evaluate    ${v1} - ${v2}
    Log    ${result}
    ${result}   Evaluate    ${v1} * ${v2}
    Log    ${result}
    ${result}   Evaluate    ${v1} / ${v2}
    Log    ${result}
    ${result}   Evaluate    ${v1} % ${v2}
    Log    ${result}
    
    ${radius}   Set Variable   1
    ${pie}      Set Variable    3.14
    ${area}     Evaluate    ${pie} * ${radius} * ${radius}
    Log    ${area}