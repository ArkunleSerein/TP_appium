*** Settings ***
Documentation    Importe les libraries et les ressources
Library    String
Library    AppiumLibrary
Resource   variable.resource


*** Keywords ***
Click Digit
    [Documentation]    Crée une fonction qui va convertir le chiffre en id et cliquer dessus
    [Arguments]    ${digit}
    ${locator}=    Set Variable    id=com.google.android.calculator:id/digit_${digit}
    Log    Clicking element 'id=com.google.android.calculator:id/digit_${digit}'.
    Click Element    ${locator}

Click Operator
    [Documentation]    Crée une fonction qui va convertir l'opérateur en id et cliquer dessus
    [Arguments]    ${operator}
    ${op}=    Set Variable If    '${operator}' == '+'    add
    ...                        '${operator}' == '-'    sub
    ...                        '${operator}' == 'x'    mul
    ...                        '${operator}' == '/'    div
    ${locator}=    Set Variable    id=com.google.android.calculator:id/op_${op}
    Log    Clicking element 'id=com.google.android.calculator:id/op_${op}'.
    Click Element    ${locator}

Calculate
    [Documentation]    Crée une fonction de calcul
    [Arguments]    ${first_number}    ${operator}    ${second_number}    ${expected_result}
    Log    Calcul: ${first_number} ${operator} ${second_number} = ${expected_result}
    Click Digit    ${first_number}
    Click Operator    ${operator}
    Click Digit    ${second_number}
    Wait Until Page Contains Element    ${RESULT_PREVIEW}
    Element Text Should Be              ${RESULT_PREVIEW}    ${expected_result}
    Log    Result: ${expected_result}
    Click Element    ${EQUAL}

Click Element If Visible
    [Documentation]    This keyword clicks an element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=5s
    Page Should Contain Element    ${locator}
    Log    Clicking on ${locator}
    Click Element    ${locator}

Get Text From People Names List
    [Documentation]    Crée une fonction qui va chercher chaque élément, récupérer le texte et l'envoyer dans les logs
    [Arguments]    @{names}
    FOR    ${name}    IN    @{names}
        ${element}=    Get Text    //android.widget.TextView[@text="${name}"]
        Log    Element Text: ${element}
    END
