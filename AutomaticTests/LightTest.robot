*** Settings ***
Library    SeleniumLibrary  
Resource    Resources/Resource1.robot

*** Variables ***
${URL}    http://www.thetestingworld.com/testings
${Browser}    Chrome

*** Test Cases ***
#Create Folder at Runtime
#    create_folder
Robot 2nd Tuto
    ${Res}=    Start Browser and Maximize    ${URL}    ${Browser}
    Log    ${Res}
    Set Browser Implicit Wait    3
    Enter Credentials    ${Res}    testingworldindia@gmail.com    123456
    KW_Test
    Radio Button
    CheckBox
    Link

*** Keywords ***
Enter Credentials
    [Arguments]        ${username}    ${email}    ${password}
    Input Text    name:fld_username    ${username}
    Input Text    name:fld_email    ${email}
    Input Text    name:fld_password    ${password}
    
Radio Button
    Select Radio Button    add_type    office
    
CheckBox
    Select Checkbox    terms
    
Link
    Click Link    xpath://a[text()='Read Detail']
    #Sleep    2
    #Click Button    xpath://input[@type='close']
    #Click Button    xpath://*[@id="popup1"]\a