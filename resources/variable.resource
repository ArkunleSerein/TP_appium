*** Variables ***
# Application
# Appium Server
${REMOTE_URL}        http://localhost:4723/wd/hub
${PLATFORM_NAME}     Android
${PLATFORM_VERSION}  15
${DEVICE_NAME}       emulator-5554
# Calculator App
${CALCULATOR_APP_PACKAGE}       com.google.android.calculator
${CALCULATOR_APP_ACTIVITY}      com.android.calculator2.Calculator

#    API Demos App
${API_DEMOS_APP_PACKAGE}        io.appium.android.apis
${API_DEMOS_APP_ACTIVITY}       io.appium.android.apis.ApiDemos

# Operateurs

${EQUAL}     id=com.google.android.calculator:id/eq

# Resultat
${RESULT_PREVIEW}    id=com.google.android.calculator:id/result_preview

# DATA
@{CUSTOM_ADAPTER_LIST}    Arnold  Barry  Chuck  David

# Locator
${EXPANDABLE_LISTS}     //android.widget.TextView[@content-desc="Expandable Lists"]
${PEOPLE_NAMES_LIST}    //android.widget.TextView[@text="People Names"]
${TOGGLE_BUTTON}    id=io.appium.android.apis:id/button_toggle

${DATE_WIDGET}    //android.widget.TextView[@content-desc="Date Widgets"]
${DIALOG_DATE_WIDGET}    //android.widget.TextView[@content-desc="1. Dialog"]
${INLINE_DATE_WIDGET}    //android.widget.TextView[@content-desc="2. Inline"]

${CHANGE_DATE_BUTTON}    io.appium.android.apis:id/pickDate
${CHANGE_DATE_YEAR_BUTTON}    android:id/date_picker_header_year
${CHANGE_DATE_YEAR}    //android.widget.TextView[@resource-id="android:id/text1" and @text="2003"]




${CHANGE_TIME_BUTTON}    io.appium.android.apis:id/pickTime
${CHANGE_TIME_SPINNER_BUTTON}    io.appium.android.apis:id/pickTimeSpinner
