*** Settings ***
Library    RequestsLibrary



*** Test Cases ***
upload regression test result on zephyr
    ${header}   Create Dictionary       Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczovL2xlYXJuYXBpLmF0bGFzc2lhbi5uZXQiLCJ1c2VyIjp7ImFjY291bnRJZCI6IjYwMTgwMWYyNGUyNThlMDA2OTQ2NjYxYyJ9fSwiaXNzIjoiY29tLnRoZWQuemVwaHlyLmplIiwic3ViIjoiNjJlODhmYzgtODg5YS0zZmEzLWIwOTAtZTkxOTgxZGNhNzBkIiwiZXhwIjoxNzQ0MDA5MjM2LCJpYXQiOjE3MTI0NzMyMzZ9.9QeXNB7xZnk1o8-ewW-p_-pIXctHi5OGg5tFIH3hHNk
    ${xml_file}     Get File For Streaming Upload   log/junitresult.xml
    ${file}        Create Dictionary    file=${xml_file}
    ${params}       Create Dictionary       projectKey=SCRUM    autoCreateTestCases=true
    POST    https://prod-api.zephyr4jiracloud.com/v2/automations/executions/junit   params=${params}    headers=${header}   files=${file}