*** Variables ***
${BROWSER}        edge
${URL}            file:///D:/Bhavana/Testing/Practice/Formats/testing%20UI.html
${Username}       Bhavanat12345
${Password}       Bhavana@12
${Username_less than 10 characters}    Bhavana
${error1}         Invalid username format
${Username_more than 15 characters}    Bhavana123456789
${Username_without upper case}    bhavana12341
${Username_without Number}    Bhavanatabc
${Username_with_Specialcharater}    Bhavana@123t
${Password_without_Specialcharacter}    BhavanaT1
${Password_without_Captialletter}    bhavana@12
${Password_without_number}    Bhavana@we
${Password_less_than_6character}    Bha@1
${Password_more_than_10characters}    Bhavana@123456
${Mismatched_ConfirmPassword}    @12wdQvchji
${Incorrect_Password}    Bhavana1234
${Incorrect_Username}    Bhavanartfsd
