*** Settings ***
Library    SeleniumLibrary   

Test Setup       Open Browser    ${url}   ${browserName} 
Test Teardown    Close Browser

Default Tags    regression

*** Test Cases ***

 Login with the valid username and password
   LoginKW
   
Check that login with the blank username and password shows the validation message
    Click Button    ${loginButton}
    Wait Until Element Is Visible    css:div[class='govuk-error-summary']
    Should Be Equal As Strings    Your email/password combination doesn't seem to work    Your email/password combination doesn't seem to work      
    

*** Variables ***

${url}  https://apply-for-innovation-funding.service.gov.uk/
${browserName}  chrome  
&{loginDetails}  username=standard_user   password=secret_password
${userName} =  css:input[id='username']
${password} =  css:input[id='password']
${loginButton} =  css:button[id='sign-in-cta'] 
 
*** Keywords ***

LoginKW
    Input Text    ${userName}    &{loginDetails}[username]
    Input Password    ${password}    &{loginDetails}[password]   
    Click Button    ${loginButton} 