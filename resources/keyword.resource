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

# Cliquer sur Views dans le menu principal.
# Vérifier l'accès aux sous-sections comme Expandable Lists, Date Widgets, etc.
# Ouvrir custom adapter et vérifier que chaque champs a bien tout les noms.
# Exemple : People names = Arnold / Barry / Chuck / David

Open Views
    [Documentation]    Cliquer sur Views dans le menu principal.
    Click Element    //android.widget.TextView[@content-desc="Views"]

Open Different Under Sections
    [Documentation]    Cliquer sur Views dans le menu principal.
    Click Element If Visible    //android.widget.TextView[@content-desc="Expandable Lists"]
    Page Should Contain Element    //android.widget.ListView[@resource-id="android:id/list"]
    Press Keycode    4
    Click Element If Visible    //android.widget.TextView[@content-desc="Date Widgets"]
    # Page Should Contain Element    id=android:id/text1
    # ...    //android.widget.TextView[@text="Date Widgets"]
