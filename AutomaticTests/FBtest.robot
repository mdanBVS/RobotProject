*** Settings ***
Library    SeleniumLibrary  
Resource    Resources/Resource1.robot

*** Variables ***
${URL}    http://www.facebook.com/
${Browser}    Chrome

*** Test Cases ***
#Create Folder at Runtime
#    create_folder
Robot 2nd Tuto
    ${Res}=    Start Browser and Maximize    ${URL}    ${Browser}
    Log    ${Res}
    Enter Credentials    hello    Abcd

*** Keywords ***
Enter Credentials
    [Arguments]        ${email}    ${password}
    #Input Text    id:email    ${username}
    Input Text    id:email    ${email}
    Input Text    id:pass    ${password}
    Click Button    xpath://input[@type='submit']
    Click Link    xpath://a[text()='Forgotten account']