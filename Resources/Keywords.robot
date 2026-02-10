*** Keywords ***
Clean Up All Browsers
    Run Keyword And Ignore Error    Close All Browsers
    Run Keyword And Ignore Error    Run Process    taskkill    /f    /im    chrome.exe
    Run Keyword And Ignore Error    Run Process    taskkill    /f    /im    chromedriver.exe

Open Dummy Meter UI
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Maximize Browser Window
