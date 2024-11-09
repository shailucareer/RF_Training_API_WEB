*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1 - Practice Javascript
    Open Browser    https://letcode.in/edit     chrome
    Execute Javascript      alert("Hello World")
    Sleep    2s


TC2 - Practice Javascript
    Open Browser    https://letcode.in/edit     chrome
    Execute Javascript      var elem=document.getElementById("fullName");
    ...                     elem.value="Hello World"
    Sleep    2s

TC3 - Practice Javascript
    Open Browser    https://letcode.in/edit     chrome
    Execute Javascript      ARGUMENTS   Hello Automation    Hello Selenium        JAVASCRIPT    var elem=document.getElementById("fullName");
    ...                     elem.value=arguments[1];
    Sleep    2s

TC4 - Practice Javascript
    Open Browser    https://letcode.in/edit     chrome
    #${data}     Execute Javascript      return confirm("Ready?");
    ${data}     Execute Javascript      function abc(){
    ...         return document.getElementById("join").value;
    ...         }
    ...         abc();
    Sleep    2s
    Log    ${data}

TC5 - Practice Javascript
    Open Browser    https://letcode.in/edit     chrome
    ${data}     Execute Javascript      ARGUMENTS   A   B   C   D       JAVASCRIPT      ${CURDIR}/demo.js
    Sleep    2s

TC6 - Send WebElement as Argument to a JS
    Open Browser    https://letcode.in/edit     chrome
    ${elem}     Get WebElement    id:fullName
    ${data}     Execute Javascript      ARGUMENTS   ${elem}     SSR       JAVASCRIPT      ${CURDIR}/demo1.js
    Sleep    2s

TC7 - Get value from JS
    Open Browser    https://letcode.in/edit     chrome
    ${elem}     Get WebElement    id:join
    ${data}     Execute Javascript      ARGUMENTS   ${elem}    JAVASCRIPT      ${CURDIR}/demo2.js
    Log    ${data}
    Should Be Equal    ${data}    I am good
    Sleep    2s


TC8 - Scroll into view demo
    Open Browser    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html     chrome
    Sleep    5s
    Scroll Element Into View    xpath://a[contains(.,'Element Into View')]
    Sleep    2s


TC9 - Scroll to Mid Demo
    Open Browser    https://letcode.in/test    chrome
    ${elem}     Get WebElement    link:Timeout
    Capture Page Screenshot
    Execute Javascript      ARGUMENTS   ${elem}     JAVASCRIPT  var innerHeight = window.innerHeight;
    ...     var pos = arguments[0].getBoundingClientRect().top;
    ...     window.scrollTo(0,pos-innerHeight/2);
    Capture Page Screenshot
## Scroll to Mid
## window.innerHeight;
## $x("//a[.='Timeout']")[0].getBoundingClientRect().top;
## window.scrollTo(0,2600)
