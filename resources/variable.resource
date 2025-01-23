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
