*** Settings ***
Library    FakerLibrary
Library    ../DataDrivenTestingDirectory/FileHandler.py


*** Test Cases ***
FakerLibrary Words Generation
    ${words}=    FakerLibrary.Words
    Log    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log    words: ${words}

Generate random name
    ${name}     FakerLibrary.Name
    ${name}     FakerLibrary.Name


Generate random First and Last names
    ${name}     FakerLibrary.First Name
    ${name}     FakerLibrary.Last Name
    ${name}     FakerLibrary.First Name Female
    ${name}     FakerLibrary.First Name Male


Generate random email
    ${email}     FakerLibrary.Email
    ${email}     FakerLibrary.Company Email
    ${email}     FakerLibrary.Free Email

Generate random phone
    ${ph}     FakerLibrary.Phone Number
    ${ph}     FakerLibrary.Basic Phone Number


Generate address
    ${streetAddress}     FakerLibrary.Street Address
    ${var}     FakerLibrary.Street Name
    ${var}     FakerLibrary.Street Suffix
    ${var}     FakerLibrary.City
    ${var}     FakerLibrary.Postalcode
    ${var}     FakerLibrary.Postalcode In State
    ${var}     FakerLibrary.State
    ${var}     FakerLibrary.Country

Generate xls fake data
    FOR    ${counter}    IN RANGE   0     100
        ${var}      FakerLibrary.First Name
        Set Cell Value    ${CURDIR}/data1.xlsx    Sheet1    ${counter}    0    ${var}
    END


