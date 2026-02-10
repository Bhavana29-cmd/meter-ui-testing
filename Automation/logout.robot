*** Settings ***
Suite Teardown    Clean Up All Browsers
Library           SeleniumLibrary
Library           OperatingSystems
Library           DateTime
Resource          ../Resources/Variable.robot
Resource          ../Resources/Keywords.robot

*** Test Cases ***
TC_01 Logout Functionlaity
    Open Dummy Meter UI
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    Alert Should Be Present    Account created successfully
    Wait Until Element Is Visible    xpath=//*[@id="loginPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Username}
    Input Text    xpath=//*[@id="loginPass"]    ${Password}
    Click Button    xpath=//button[text()='Login']
    Wait Until Element Is Visible    //*[@id="dashboardPage"]/p    10s
    Set Selenium Speed    0s
    ${Data}=    Get Text    xpath=//*[@id="dashboardPage"]/p
    Log    ${Data}
    Click Element    xpath=//div[text()='Logout']
    Wait Until Element Is Visible    xpath=//*[@id="loginPage"]/h2    10s
    Close Browser

TC_02 User session behavior after refreshing the UI
    Open Dummy Meter UI
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    Alert Should Be Present    Account created successfully
    Wait Until Element Is Visible    xpath=//*[@id="loginPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Username}
    Input Text    xpath=//*[@id="loginPass"]    ${Password}
    Click Button    xpath=//button[text()='Login']
    Wait Until Element Is Visible    //*[@id="dashboardPage"]/p    10s
    Set Selenium Speed    0s
    ${Data2}=    Get Text    xpath=//*[@id="dashboardPage"]/p
    Log    ${Data2}
    Reload Page
    ${Data3}=    Get Text    xpath=//*[@id="dashboardPage"]/p
    Log    ${Data3}
    Click Element    xpath=//div[text()='Logout']
    Wait Until Element Is Visible    xpath=//*[@id="loginPage"]/h2    10s
    Close Browser
