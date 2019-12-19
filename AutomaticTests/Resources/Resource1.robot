*** Settings ***
library    SeleniumLibrary
#Library    /AutomaticTests/ExternalKeywords/UserKeywords.py
#Resource    ../ExternalKeywords/UserKeywords.py
Library    ../ExternalKeywords/UserKewords2.py
#Library    ../ExternalKeywords/light_test.py

*** Variables ***

*** Keywords ***
Start Browser and Maximize
    [Arguments]    ${UserURL}    ${InputBrowser}
    Open Browser    ${UserURL}    ${InputBrowser}
    Maximize Browser Window
    ${Title}=    Get Title
    [Return]    ${Title}
KW_Test
    Create Folder   