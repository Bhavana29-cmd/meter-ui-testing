*** Variables ***
${BROWSER}        edge
${URL}            file:///D:/Bhavana/Testing/Practice/Formats/testing%20UI.html
${Username}       Testuser12345
${Password}       Test@12
${Username_less than 10 characters}    Testuser
${error1}         Invalid username format
${Username_more than 15 characters}    Testuser123456789
${Username_without upper case}    testuser123
${Username_without Number}    Testuserabc
${Username_with_Specialcharater}    Testuser@123
${Password_without_Specialcharacter}    Testuser1
${Password_without_Captialletter}    testuser@12
${Password_without_number}    Testuser@we
${Password_less_than_6character}    Tes@1
${Password_more_than_10characters}    Testuser@123456
${Mismatched_ConfirmPassword}    @12wdQvchji
${Incorrect_Password}    Test1234
${Incorrect_Username}    Testusertfsd
