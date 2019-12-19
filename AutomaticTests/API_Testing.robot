*** Setting ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ****
${Base_URL}        http://thetestingworldapi.com/
${App_Base_URL}    http://thetestingworldapi.com/
${StudentID}       28
${StudentID2}       1515

*** Test Cases ***
TC_001_Get_Request
    [Tags]    TAG1
    Create Session    Get_Student_Details    ${Base_URL}
    ${response}=    get request    Get_Student_Details    api/studentsDetails
    #Check with Terminal with 'cd PATH' folowed by 'robot TC_001_Get_Request.robot' will give all data
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    
TC_002_Fetch_Student_details_by_id
    [Tags]    TAG2
    create session    FetchData    ${App_Base_URL}
    ${response2}=    get request    FetchData    api/studentsDetails/${StudentID}
    ${actual_code}=    Convert To String    ${response2.status_code}
    Should Be Equal    ${actual_code}    200
    #Log To Console    ${Response2.status_code}
    #Log To Console    ${Response2.content}
    
TC_003_Validate delete request
    [Tags]    TAG3
    create session    AppAccess    ${Base_URL}
    ${response3}=    delete request    AppAccess    api/studentsDetails/${StudentID}
    ${code}=    Convert To String    ${response3.status_code}
    Should Be Equal    ${code}    200
    ${JSONresponse}=    to json    ${response3.content}
    @{status_list}=    Get Value From Json    ${JSONresponse}    status
    ${status}=    get from list    ${status_list}    0
    should be equal    ${status}    true

TC_004_Create new resource
    [Tags]    TAG4
    Create Session    AddData    ${Base_URL}
    &{body}    create dictionary    first_name=Testing    middle_name=A    last_name=World    date_of_birth=12/12/1990
    &{header}=    create dictionary    Content-Type=application/json
    ${response4}=    Post Request    AddData    api/studentsDetails    data=${body}    headers=&{header}
    ${code}=    Convert To String    ${response4.status_code}
    Should Be Equal    ${code}    201
    
TC_005_PUT_Request
    [Tags]    TAG5
    Create Session    AddData    ${Base_URL}
    &{body}    create dictionary    first_name=Testing    middle_name=8743913121    last_name=World    date_of_birth=12/12/1990
    &{header}=    create dictionary    Content-Type=application/json
    ${response5}=    Put Request    AddData    api/studentsDetails/${StudentID2}    data=${body}    headers=&{header}
    ${code}=    Convert To String    ${response5.status_code}
    Should Be Equal    ${code}    201
    






