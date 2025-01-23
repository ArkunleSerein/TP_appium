*** Settings ***
Documentation    Importe les libraries et les ressources
Library    AppiumLibrary
Resource    ../resources/keyword.resource


*** Test Cases ***
Calculator Testcase
    [Documentation]    Test to open Google Calculator on an emulator
    Open Application To Google Calculator
    Calculate 5 + 3
    Calculate 2 - 7
    Close Application
