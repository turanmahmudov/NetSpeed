TEMPLATE = app
TARGET = NetSpeed

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp

RESOURCES += NetSpeed.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  NetSpeed.apparmor \
               NetSpeed.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)               

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               NetSpeed.desktop
               
#specify where the config files are installed to
config_files.path = /NetSpeed
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /NetSpeed
desktop_file.files = $$OUT_PWD/NetSpeed.desktop
desktop_file.CONFIG += no_check_exist
INSTALLS+=desktop_file               

# Default rules for deployment.
#target.path = /opt/$${TARGET}/bin
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

DISTFILES += \
    scripts/userscript.js \
    userscript.js
