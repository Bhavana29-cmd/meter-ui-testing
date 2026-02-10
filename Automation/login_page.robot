*** Settings ***
Suite Teardown    Clean Up All Browsers
Library           SeleniumLibrary
Library           OperatingSystems
Library           DateTime
Resource          ../Resources/Variable.robot
Resource          ../Resources/Keywords.robot

*** Test Cases ***
TC_01 Login Page validation
    #Login with valid credentials
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
    ${Data1}=    Get Text    xpath=//*[@id="dashboardPage"]/p
    Log    ${Data1}
    Click Element    xpath=//div[text()='Logout']
    Wait Until Element Is Visible    xpath=//*[@id="loginPage"]/h2    10s
    #Login with invalid credentials
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Incorrect_Username}
    Input Text    xpath=//*[@id="loginPass"]    ${Incorrect_Password}
    Click Button    xpath=//button[text()='Login']
    Set Selenium Speed    0s
    ${error_11}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_11}
    Should Be True    '${error_11}' == 'Invalid username or password'
    #Login with invalid Username
    Reload Page
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Username}
    Input Text    xpath=//*[@id="loginPass"]    ${Incorrect_Password}
    Click Button    xpath=//button[text()='Login']
    Set Selenium Speed    0s
    ${error_12}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_12}
    Should Be True    '${error_12}' == 'Invalid username or password'
    #Login with invalid Password
    Reload Page
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Incorrect_Username}
    Input Text    xpath=//*[@id="loginPass"]    ${Password}
    Click Button    xpath=//button[text()='Login']
    Set Selenium Speed    0s
    ${error_13}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_13}
    Should Be True    '${error_13}' == 'Invalid username or password'
    #Login with Empty Password
    Reload Page
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginUser"]    ${Username}
    Click Button    xpath=//button[text()='Login']
    Set Selenium Speed    0s
    ${error_14}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_14}
    Should Be True    '${error_14}' == 'Password is required'
    #Login with Empty Username
    Reload Page
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="loginPass"]    ${Password}
    Click Button    xpath=//button[text()='Login']
    Set Selenium Speed    0s
    ${error_15}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_15}
    Should Be True    '${error_15}' == 'Username is required'
    #Login with Empty Username and Password
    Reload Page
    Set Selenium Speed    0.5s
    Click Button    xpath=//button[text()='Login']
    Set Selenium Speed    0s
    ${error_16}=    Get Text    xpath=//*[@id="loginError"]
    Log    ${error_16}
    Should Be True    '${error_16}' == 'Username and Password are required'
    Close Browser
