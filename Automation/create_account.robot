*** Settings ***
Suite Teardown    Clean Up All Browsers
Library           SeleniumLibrary
Library           OperatingSystems
Library           DateTime
Resource          ../Resources/Variable.robot
Resource          ../Resources/Keywords.robot

*** Test Cases ***
TC_01 Create account with valid details
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

TC_02 Create account with Invalid formats of Username
    #Create account with username less than 10 characters
    Open Dummy Meter UI
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username_less than 10 characters}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error}
    Should Be True    '${error}' == 'Username must be at least 10 characters'
    #Create account with username more than 15 characters
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username_more than 15 characters}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_1}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_1}
    Should Be True    '${error_1}' == 'Username must be maximum 15 characters'
    #Create account with username without Uppercase letter
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username_without upper case}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_2}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_2}
    Should Be True    '${error_2}' == 'Username must contain at least one capital letter'
    #Create account with username without number
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username_without Number}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_3}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_3}
    Should Be True    '${error_3}' == 'Username must contain at least one number'
    #Create account with username with special character
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username_with_Specialcharater}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_4}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_4}
    Should Be True    '${error_4}' == 'Special characters are not allowed in username'
    Close Browser

TC_03 Create account with Invalid formats of Password
    #Create account with password without special character
    Open Dummy Meter UI
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password_without_Specialcharacter}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_5}=    Get Text    xpath=//*[@id="passError"]
    Log    ${error_5}
    Should Be True    '${error_5}' == 'Password must contain at least one special character'
    #Create account with password without capital Letter
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password_without_Captialletter}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_6}=    Get Text    xpath=//*[@id="passError"]
    Log    ${error_6}
    Should Be True    '${error_6}' == 'Password must contain at least one capital letter'
    #Create account with password without Number
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password_without_number}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_7}=    Get Text    xpath=//*[@id="passError"]
    Log    ${error_7}
    Should Be True    '${error_7}' == 'Password must contain at least one number'
    #Create account with password less than 6 characters
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password_less_than_6character}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_8}=    Get Text    xpath=//*[@id="passError"]
    Log    ${error_8}
    Should Be True    '${error_8}' == 'Password must be at least 6 characters'
    #Create account with password more than 10 characters
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password_more_than_10characters}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_9}=    Get Text    xpath=//*[@id="passError"]
    Log    ${error_9}
    Should Be True    '${error_9}' == 'Password must be maximum 10 characters'
    Close Browser

TC_04 Create account with mismatched confirm password
    Open Dummy Meter UI
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Mismatched_ConfirmPassword}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_5}=    Get Text    xpath=//*[@id="confirmError"]
    Log    ${error_5}
    Should Be True    '${error_5}' == 'Password and Confirm Password do not match'
    Close Browser

TC_05 Create account with all fields blank
    #CASE-1 All 3 Flieds empty
    Open Dummy Meter UI
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Click Button    xpath=//button[text()='Create']
    ${error_6}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_6}
    Should Be True    '${error_6}' == 'Username cannot be empty'
    #CASE-2 Username Flieds empty
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_7}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_7}
    Should Be True    '${error_7}' == 'Username cannot be empty'
    #CASE-3 Username and Password Flieds empty
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_8}=    Get Text    xpath=//*[@id="userError"]
    Log    ${error_8}
    Should Be True    '${error_8}' == 'Username cannot be empty'
    #CASE-4 \ Password Flieds empty
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="confirmPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_9}=    Get Text    xpath=//*[@id="passError"]
    Log    ${error_9}
    Should Be True    '${error_9}' == 'Password cannot be empty'
    #CASE-5 \ Confirm Password Flieds empty
    Reload Page
    Click Button    xpath=//button[text()='Create Account']
    Wait Until Element Is Visible    xpath=//*[@id="createPage"]/h2    10s
    Set Selenium Speed    0.5s
    Input Text    xpath=//*[@id="newUser"]    ${Username}
    Input Text    xpath=//*[@id="newPass"]    ${Password}
    Click Button    xpath=//button[text()='Create']
    Set Selenium Speed    0s
    ${error_10}=    Get Text    xpath=//*[@id="confirmError"]
    Log    ${error_10}
    Should Be True    '${error_10}' == 'Password and Confirm Password do not match'
    Close Browser
