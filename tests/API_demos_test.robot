*** Settings ***
Documentation    Importe les libraries et les ressources
Library    AppiumLibrary
Resource    ../resources/keyword.resource


*** Test Cases ***
API Demos Testcase
    [Documentation]    Test to open API Demos on an emulator
    Open Application To API Demos
    Check API Demos's Logo
    Open Views
    Open Different Under Sections
    # Open Date Widgets
