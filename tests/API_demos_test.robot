*** Settings ***
Documentation    Importe les libraries et les ressources
Library    AppiumLibrary
Resource    ../resources/keyword.resource

Test Setup    Open Application To API Demos
Test Teardown    Close Application


*** Test Cases ***
I want To Open API Demos And Verify Logo
    [Documentation]    Test to open API Demos on an emulator
    Check API Demos's Logo

I Want To Go On Different Under Sections From Views
    [Documentation]    TestCase To Verify Different Under Sections from views
    Open Views
    Open Different Under Sections

I want To Go On Custom Adapter Page To Verify People Names
    [Documentation]    TestCase To Verify People Names
    Open Views
    Open Custom Adapter And Verify Names

I want To Click On Toggle Button And Verify Its State
    [Documentation]    TestCase To Verify Toggle Button
    Open Views
    Open Buttons

I Want To Use Date Widget
    [Documentation]    TestCase To Verify Date Widget
    Open Views
    Open Date Widget
