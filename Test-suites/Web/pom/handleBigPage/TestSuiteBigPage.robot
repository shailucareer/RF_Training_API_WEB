*** Settings ***
Resource    common_importer.robot
Test Setup      Launch Browser
Test Teardown   Quit Browser

*** Keywords ***
Launch Browser
    Open Browser        https://www.flipkart.com/       chrome

Quit Browser
    Close All Browsers

*** Test Cases ***
Verify search is working and user is able to navigate back to home page by clicking logo
    Home_Header.Verify search field is present and search passed content        iphone 16
    Home_Header.Verify logo is present and on click it takes user to home screen

Verify grocery page is working
    Home_Navigation.Click on Grocery link and verify the navigation
    GroceryMarketPlace.Take me to Flipkart home