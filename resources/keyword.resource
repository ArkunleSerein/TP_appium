*** Settings ***
Documentation    Importe les libraries et les ressources
Library    String
Library    AppiumLibrary

Resource    ../resources/variable.resource
Resource    ../resources/library.resource


*** Keywords ***
Open Application To Google Calculator
    [Documentation]    Test pour ouvrir l'application google calculator
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appActivity=${CALCULATOR_APP_ACTIVITY}
    ...    appPackage=${CALCULATOR_APP_PACKAGE}

Calculate 5 + 3
    [Documentation]    Vérifier qu’une addition des chiffres 5 et 3 donne le résultat 8
    Calculate    5    +    3    8

Calculate 2 - 7
    [Documentation]    Vérifier qu’une soustraction des chiffres 2 et 7 donne le résultat -5

    Calculate    2    -    7    −5

Open Application To API Demos
    [Documentation]    Test pour ouvrir l'application API Demos
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appActivity=${API_DEMOS_APP_ACTIVITY}
    ...    appPackage=${API_DEMOS_APP_PACKAGE}

# 1. Lancement et vérification de l'écran d'accueil
# Test : Vérifier que l'application se lance correctement et que l'écran d'accueil est affiché.

# Lancer l'application.
# Vérifier la présence du logo API Demos
# Vérifier que le menu principal est accessible.

Check API Demos's Logo
    [Documentation]    Vérifier la présence du logo API Demos
    Page Should Contain Element    //android.widget.TextView[@text="API Demos"]

Check API Demos's Menu
    [Documentation]    Vérifier que le menu principal est accessible.
    Page Should Contain Element    id=android:id/list

# 2. Interaction avec le menu 'Views'
# Test : Vérifier la navigation dans le menu Views et l'ouverture de sous-sections.
# Étapes :
# Cliquer sur Views dans le menu principal.
# Vérifier l'accès aux sous-sections comme Expandable Lists, Date Widgets, etc.

Open Views
    [Documentation]    Cliquer sur Views dans le menu principal.
    Click Element If Visible    //android.widget.TextView[@content-desc="Views"]

Open Different Under Sections
    [Documentation]    Cliquer sur Views dans le menu principal.
    Click Element If Visible    ${EXPANDABLE_LISTS}
    Page Should Contain Element    //android.widget.ListView[@resource-id="android:id/list"]
    Press Keycode    4
    Click Element If Visible    //android.widget.TextView[@content-desc="Date Widgets"]
    Page Should Contain Element    class=android.widget.ListView
    Press Keycode    4

# Ouvrir custom adapter depuis expandable lists et vérifier que chaque champs a bien tout les noms.
# Exemple : People names = Arnold / Barry / Chuck / David

Open Custom Adapter And Verify Names
    [Documentation]    Ouvrir custom adapter et vérifier que chaque champs a bien tout les noms.
    Click Element If Visible    ${EXPANDABLE_LISTS}
    Click Element If Visible    //android.widget.TextView[@content-desc="1. Custom Adapter"]
    Click Element If Visible    ${PEOPLE_NAMES_LIST}
    Get Text From People Names List    @{CUSTOM_ADAPTER_LIST}

#  Cliquer sur buttons et mettre le boutton en Off

Open Buttons
    [Documentation]    Cliquer sur buttons et mettre le boutton en Off
    Click Element If Visible    //android.widget.TextView[@content-desc="Buttons"]
    Click Element If Visible    ${TOGGLE_BUTTON}
    ${text} =    Get Text    ${TOGGLE_BUTTON}
    IF    '${text}' != 'OFF'    Click Element If Visible    ${TOGGLE_BUTTON}
    Element Text Should Be    ${TOGGLE_BUTTON}    OFF

# 4. Utilisation du Date Widget
# Test : Tester l'interaction avec le widget de date. # Vérifier à chaque fois
# Dans le dialog :
# Change the date > 04/07/2003
# change the time > 11:47 PM
# Change the time spinner > 04:39 PM
# Et dans le Inline
# changer la date avec le clavier et mettre 12:12 AM

#TODO 

Open Date Widget
    [Documentation]    Ouvrir le widget de date
    Click Element If Visible    ${DATE_WIDGET}
    Click Element If Visible    ${DIALOG_DATE_WIDGET}
    Click Element If Visible    ${CHANGE_DATE_BUTTON}
    Click Element If Visible    ${CHANGE_DATE_YEAR_BUTTON}

#TODO

#     Page Should Contain Element    //android.widget.TextView[@content-desc="04/07/2003"]
#     Page Should Contain Element    //android.widget.TextView[@content-desc="11:47 PM"]
#     Page Should Contain Element    //android.widget.TextView[@content-desc="04:39 PM"]

# Open Inline Date Widget
#     [Documentation]    Ouvrir le widget de date
#     Click Element If Visible    //android.widget.TextView[@content-desc="Date Widgets"]
#     Click Element If Visible    ${INLINE_DATE_WIDGET}
#     Page Should Contain Element    //android.widget.TextView[@content-desc="04/07/2003"]
#     Page Should Contain Element    //android.widget.TextView[@content-desc="11:47 PM"]
#     Page Should Contain Element    //android.widget.TextView[@content-desc="04:39 PM"]

# Open Time Widget
#     [Documentation]    Ouvrir le widget de date
#     Click Element If Visible    //android.widget.TextView[@content-desc="Date Widgets"]
#     Click Element If Visible    ${TIME_WIDGET}
#     Page Should Contain Element    //android.widget.TextView[@content-desc="11:47 PM"]
#     Page Should Contain Element    //android.widget.TextView[@desc="04:39 PM"]
