


*** Test Cases ***

WHILE: A simple while loop
    Log     Starting the while loop

    WHILE    False
        Log    Executed until the default loop limit (10000) is hit.
    END

    WHILE    True
        Log    Executed until the default loop limit (10000) is hit.
    END

WHILE: A simple while loop using the default loop limit
    WHILE    True    limit=10
        Log    Executed until the default loop limit (10) is hit.
    END

WHILE: Loop while the default limit (10) is hit
    TRY
        WHILE    True   limit=10
            Log    Executed until the default loop limit (10) is hit.
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    END

WHILE: Loop while condition evaluates to True or the default loop limit is hit
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        Log    Executed as long as the condition is True.
        ${x}=    Evaluate    ${x} + 1
    END


Print table from 2 to 10
    FOR    ${number}    IN RANGE    2    11
        FOR    ${counter}    IN RANGE    1    11
             ${result}   Evaluate    ${counter}*${number}
        END
    END
