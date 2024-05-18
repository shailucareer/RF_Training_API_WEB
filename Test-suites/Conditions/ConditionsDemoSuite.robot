


*** Test Cases ***

Condition explanation tc
    # >
    ${age}  Set Variable    18
    Log    ${age}
    ${result}   Evaluate    ${age} > 17
    #                           17 > 17
    Log    ${result}

    ${result}   Evaluate    ${age} >= 18
    #                           18 >= 18
    #                           18 GREATER OR EQUAL TO 18
    Log    ${result}

    ${result}   Evaluate    ${age} < 101
    #                           18 < 101
    #                           18 IS LESS THAN 101
    Log    ${result}

    # Vote allow for person of |age more than 17| and |less than 101|
    #                          |     17 Yr 1 mon|
    # Vote allow for person of |age more than or equal to 18| and |less than or equal to 100|

    ${age}  Set Variable    101
    ${result}   Evaluate    ${age} <= 101
    #                           18 < 101
    #                           18 IS LESS THAN 101
    Log    ${result}

    ${age}  Set Variable    17
    ${result}   Evaluate    ${age} == 18
    #                           17 == 18
    #                           17 IS EQUAL TO 18
    Log    ${result}

    ${age}  Set Variable    17
    ${result}   Evaluate    ${age} != 18
    #                           17 != 18
    #                           17 IS NOT EQUAL TO 18
    Log    ${result}

    # EXACT SIMILAR
    ${person}  Set Variable    Vijay
    ${result}   Evaluate    "${person}" == "Vijay"
    Log    ${result}

    # CASE INSENSITIVE SIMILAR
    ${person}  Set Variable    Vijay
    ${result}   Evaluate    "${person}".lower() == "vijay".lower()
    Log    ${result}

String exact match
    # EXACT MATCH
    ${person}  Set Variable    Vijay
    ${result}   Evaluate    "${person}" != "Vijay"
    Log    ${result}

String partial match
    # PARTIAL MATCH
    ${person}  Set Variable    Vijay Gangrade
    ${result}   Evaluate    "Vijay" in "${person}"
    Log    ${result}

And matching all true
    ${person}  Set Variable    Vijay Gangrade
    ${age}      Set Variable    18

    ${result1}   Evaluate    "Vijay" in "${person}"
    Log    ${result1}
    #      True

    ${result2}   Evaluate    ${age} >= 18
    Log    ${result2}
    #      True

    #                               True            True
    ${finalResult}      Evaluate    ${result1} and ${result2}
    Log    ${finalResult}


And matching all not true
    ${person}  Set Variable    Vijay Gangrade
    ${age}      Set Variable    17
    ${ward}     Set Variable    1

    ${result1}   Evaluate    "Vijay" in "${person}"
    Log    ${result1}
    #      True

    ${result2}   Evaluate    ${age} >= 18
    Log    ${result2}
    #      False

    ${result3}   Evaluate    ${ward} == 1
    Log    ${result3}
    #      False

    #                               True            False
    ${finalResult}      Evaluate    ${result1} and ${result2} and ${result3}
    Log    ${finalResult}


And matching multiple true
    ${person}  Set Variable    Vijay Gangrade
    ${age}      Set Variable    18
    ${ward}     Set Variable    1
    ${alreadyVoted}     Set Variable    ${True}

    ${result1}   Evaluate    "Vijay" in "${person}"
    Log    ${result1}
    #      True

    ${result2}   Evaluate    ${age} >= 18
    Log    ${result2}
    #      False

    ${result3}   Evaluate    ${ward} == 1
    Log    ${result3}
    #      False

    #                               True            True            True            True
    ${finalResult}      Evaluate    ${result1} and ${result2} and ${result3} and not(${alreadyVoted})
    Log    ${finalResult}

Or matching multiple true
    ${person}  Set Variable    Vijay Gangrade
    ${age}      Set Variable    18
    ${ward}     Set Variable    1
    ${alreadyVoted}     Set Variable    ${True}

    ${result1}   Evaluate    "Vijay" in "${person}"
    Log    ${result1}
    #      True

    ${result2}   Evaluate    ${age} >= 18
    Log    ${result2}
    #      False

    ${result3}   Evaluate    ${ward} == 1
    Log    ${result3}
    #      False

    #                               True            True            True            True
    ${finalResult}      Evaluate    ((${result1} or ${result2}) and ${result3}) or not(${alreadyVoted})
    Log    ${finalResult}

Practice for If Else and Else If constructs
    IF    ${True}
         Log    1.0
         Log    1.1
         Log    1.2
    END
    Log    2

    IF    ${False}
         Log    3
    END
    Log    4

    IF    ${True}
        Log     5
    ELSE
        Log     6
    END

    # LADDER
    IF    ${True}
        Log     7
    ELSE IF     ${True}
        Log     8
    ELSE
        Log     9
    END

    # NESTED IF
    IF    ${True}
          Log    10
          IF    ${True}
                Log     11
            ELSE IF     ${True}
                Log     12
            ELSE
                Log     13
            END
          Log    14
    END

Final use of all conditional statements to decide a user can vote or not
    ${person}  Set Variable    Vijay
    ${age}      Set Variable    17
    ${ward}     Set Variable    1
    ${alreadyVoted}     Set Variable    ${False}

    IF    ${age} >= 18 and ${ward} == 1 and not(${alreadyVoted}) and "Vijay" == "${person}"
        Log    You can Vote!
        Start voting process
    ELSE
        Log    You can not Vote!
    END


Run keyword if and unless example
    ${person}  Set Variable    Vijay
    ${age}      Set Variable    17
    ${ward}     Set Variable    1
    ${alreadyVoted}     Set Variable    ${False}

    #IF    ${age} >= 18 and ${ward} == 1 and not(${alreadyVoted}) and "Vijay" == "${person}"
    Run Keyword If    (${age} >= 18 and ${ward} == 1 and not(${alreadyVoted}) and "Vijay" == "${person}")       Start voting process

    Run Keyword Unless    (${age} >= 18 and ${ward} == 1 and not(${alreadyVoted}) and "Vijay" == "${person}")   Not allow to vote


*** Keywords ***

Start voting process
    Log Many    "Generate Receipt"
    ...         "Apply finger marking"
    ...         "Register Vote"
    ...         "Go home"

Not allow to vote
    Log Many    "Go home"
    ...         "File a Report, internal database"
