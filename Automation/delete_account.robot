*** Settings ***
Suite Teardown    Clean Up All Browsers
Library           SeleniumLibrary
Library           OperatingSystems
Library           DateTime
Resource          ../Resources/Variable.robot
Resource          ../Resources/Keywords.robot

*** Test Cases ***
TC_01 Delete Account Page validation
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
    ${Data4}=    Get Text    xpath=//*[@id="dashboardPage"]/p
    Log    ${Data4}
    Click Element    xpath=//div[text()='Logout']
    Wait Until Element Is Visible    xpath=//*[@id="loginPage"]/h2    10s
    #Delete account with invalid Username and password
    Click Button    xpath=//button[text()='Delete Account']
    Wait Until Element Is Visible    xpath=//*[@id="deleteAccountPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="delUser"]    ${Incorrect_Username}
    Input Text    xpath=//*[@id="delPass"]    ${Incorrect_Password}
    Click Button    xpath=//button[text()='Delete']
    Alert Should Be Present    Invalid details
    #Delete account with blank fields
    Reload Page
    Click Button    xpath=//button[text()='Delete Account']
    Wait Until Element Is Visible    xpath=//*[@id="deleteAccountPage"]/h2    10s
    Click Button    xpath=//button[text()='Delete']
    Alert Should Be Present    Invalid details
    #Delete account with invalid Username
    Reload Page
    Click Button    xpath=//button[text()='Delete Account']
    Wait Until Element Is Visible    xpath=//*[@id="deleteAccountPage"]/h2    10s
    Input Text    xpath=//*[@id="delUser"]    ${Incorrect_Username}
    Input Text    xpath=//*[@id="delPass"]    ${Password}
    Click Button    xpath=//button[text()='Delete']
    Alert Should Be Present    Invalid details
    #Delete account with invalid Password
    Reload Page
    Click Button    xpath=//button[text()='Delete Account']
    Wait Until Element Is Visible    xpath=//*[@id="deleteAccountPage"]/h2    10s
    Input Text    xpath=//*[@id="delUser"]    ${Username}
    Input Text    xpath=//*[@id="delPass"]    ${Incorrect_Password}
    Click Button    xpath=//button[text()='Delete']
    Alert Should Be Present    Invalid details
    #Delete account with valid credentials
    Reload Page
    Click Button    xpath=//button[text()='Delete Account']
    Wait Until Element Is Visible    xpath=//*[@id="deleteAccountPage"]/h2    10s
    Input Text    xpath=//*[@id="delUser"]    ${Username}
    Input Text    xpath=//*[@id="delPass"]    ${Password}
    Click Button    xpath=//button[text()='Delete']
    Alert Should Be Present    Account deleted
    Reload Page
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Username}
    Input Text    xpath=//*[@id="loginPass"]    ${Password}
    Click Button    xpath=//button[text()='Login']
    ${error_17}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_17}
    Should Be True    '${error_17}' == 'Invalid username or password'
    Close Browser
