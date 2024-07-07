*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
Launch normal chrome
    Open Browser    https://www.google.com      chrome
    Sleep    2s
    Input Text    q    chrome
    Capture Page Screenshot
    Close Browser

Launch headless chrome
    Open Browser    https://www.google.com      headlesschrome
    Sleep    2s
    Input Text    q    headlesschrome
    Capture Page Screenshot
    Close Browser


Launch normal firefox
    Open Browser    https://www.google.com      firefox
    Sleep    2s
    Input Text    q    firefox
    Capture Page Screenshot
    Close Browser

Launch headless firefox
    Open Browser    https://www.google.com      headlessfirefox
    Sleep    2s
    Input Text    q    headlessfirefox
    Capture Page Screenshot
    Close Browser


Launch normal edge
    Open Browser    https://www.google.com      edge
    Sleep    2s
    Input Text    q    edge
    Capture Page Screenshot
    Close Browser

Launch headless edge
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Open Browser    https://www.google.com      edge       options=${options}
    Sleep    2s
    Input Text    q    headlessedge
    Capture Page Screenshot
    Close Browser

Download file test in nomal chrome
    Open Browser    https://file-examples.com/wp-content/storage/2017/02/zip_2MB.zip        chrome
    Sleep    10s
    Capture Page Screenshot
    Close Browser


Download file test in nomal chrome but in specific folder
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{prefs}=    Create Dictionary    download.default_directory=${CURDIR}    download.prompt_for_download=false
    Call Method    ${options}    add_experimental_option    prefs   ${prefs}
    Open Browser    https://file-examples.com/wp-content/storage/2017/02/zip_2MB.zip        chrome      options=${OPTIONS}
    Sleep    10s
    Capture Page Screenshot
    Close Browser


Download file test in nomal firefox
    Open Browser    https://file-examples.com/wp-content/storage/2017/02/zip_2MB.zip        firefox
    Sleep    10s
    Capture Page Screenshot
    Close Browser


Download file test in nomal firefox but in specific folder > DIRECTORY CHANGE NOT WORKING
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    &{prefs}=    Create Dictionary    browser.download.folderList=2    browser.download.dir=${CURDIR}    browser.helperApps.neverAsk.saveToDisk=application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/msword,application/pdf,text/csv,text/plain,application/octet-stream    pdfjs.disabled=true    browser.download.manager.showWhenStarting=false    browser.helperApps.alwaysAsk.force=false    browser.download.manager.alertOnEXEOpen=false    browser.download.manager.focusWhenStarting=false    browser.download.manager.useWindow=false    browser.download.manager.showAlertOnComplete=false    browser.download.manager.closeWhenDone=true
    FOR    ${key}    ${value}    IN    &{prefs}
        Call Method    ${options}    set_preference    ${key}    ${value}
    END
    Open Browser    https://file-examples.com/wp-content/storage/2017/02/zip_2MB.zip        firefox      options=${OPTIONS}
    Sleep    10s
    Capture Page Screenshot
    Close Browser


Download file test in nomal edge
    Open Browser    https://file-examples.com/wp-content/storage/2017/02/zip_2MB.zip        edge
    Sleep    10s
    Capture Page Screenshot
    Close Browser

Download file test in nomal edge but in specific folder
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    &{prefs}=    Create Dictionary     download.default_directory=${CURDIR}    download.prompt_for_download=false    download.directory_upgrade=true    plugins.always_open_pdf_externally=true
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    https://file-examples.com/wp-content/storage/2017/02/zip_2MB.zip        edge      options=${OPTIONS}
    Sleep    10s
    Capture Page Screenshot
    Close Browser