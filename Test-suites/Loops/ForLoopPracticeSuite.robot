

*** Variables ***
@{ROBOTS_LIST}      Terminator      Bender    Johnny5    Robocop
@{LIST}=                    one    two    three
${STRING}=                  cat
${NUMBER}=                  ${1}
&{DICTIONARY}              string=${STRING}    number=${NUMBER}    list=@{LIST}

*** Test Cases ***

Loop over a list of items and log each of them
    FOR    ${item}    IN    @{ROBOTS_LIST}
        Log    ${item}
    END
    FOR    ${item}    IN    ${ROBOTS_LIST}
        Log    ${item}
    END


Loop over a list of items and log each of them but STOP at Terminator
    FOR    ${item}    IN    @{ROBOTS_LIST}
        Log    ${item}
        IF    "${item}" == "Terminator"
             BREAK
        END
    END

Loop over a list of items and log each of them but SKIP at Terminator
    FOR    ${item}    IN    @{ROBOTS_LIST}
        IF    "${item}" == "Terminator"
             CONTINUE
        END
        Log    ${item}
    END


Loop a list
    Log    ${LIST}    # ['one', 'two', 'three']

    FOR    ${item}    IN    @{LIST}
        Log    ${item}    # one, two, three
    END

    FOR    ${item}    IN    one    two    three
        Log    ${item}    # one, two, three
    END

Loop a dictionary
    Log    ${DICTIONARY}
    # {'string': 'cat', 'number': 1, 'list': ['one', 'two', 'three']}

    FOR    ${key_value_tuple}    IN    &{DICTIONARY}
        Log    ${key_value_tuple}
        # ('string', 'cat'), ('number', 1), ('list', ['one', 'two', 'three'])
    END


    FOR    ${key}    IN    @{DICTIONARY}
        Log    ${key}
        Log    ${DICTIONARY}[${key}]
        Log    ${DICTIONARY.${key}}
        # string=cat, number=1, list=['one', 'two', 'three']
    END

Loop a range from 0 to end index
    FOR    ${index}    IN RANGE    10
        Log    ${index}    # 0-9
        IF    ${index}==5
             BREAK
        END
    END

Loop a range from start to end index
    FOR    ${index}    IN RANGE    1    10
        Log    ${index}    # 1-9
    END

Loop a range from start to end index with steps
    FOR    ${index}    IN RANGE    0    10      2
        Log    ${index}    # 0, 2, 4, 6, 8
    END

Nested loops
    @{alphabets}=    Create List    a    b    c
    Log    ${alphabets}    # ['a', 'b', 'c']
    @{numbers}=    Create List    ${1}    ${2}    ${3}
    Log    ${numbers}    # [1, 2, 3]

    FOR    ${alphabet}    IN    @{alphabets}
        FOR    ${number}    IN    @{numbers}
            Log    ${alphabet}${number}
            # a1, a2, a3, b1, b2, b3, c1, c2, c3
        END
    END

Exit a loop on condition
    FOR    ${i}    IN RANGE    5
        IF    ${i} == 2    BREAK
        Log    ${i}    # 0, 1
    END

Continue a loop from the next iteration on condition
    FOR    ${i}    IN RANGE    3
        IF    ${i} == 1    CONTINUE
        Log    ${i}    # 0, 2
    END