*** Settings ***
Library     DatabaseLibrary

*** Test Cases ***
Select Thora detail from actor table
    Connect To Database     pymysql    sakila    root    root    127.0.0.1    3306  alias=sakiladb
    ${result}   Query    select * from actor where actor_id=200;
    Log    ${result[0][0]}
    Log    ${result[0][1]}
    Log    ${result[0][2]}
    Log    ${result[0][3]}
    Disconnect From Database    alias=sakiladb

