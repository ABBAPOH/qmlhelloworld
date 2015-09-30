TEMPLATE = app
QT *= core gui widgets quick qml
LIBS += -L/Applications/Qt/5.5/ios/qml/QtQuick/Controls/ -lqtquickcontrolsplugin
SOURCES += main.cpp
RESOURCES += qbshello.qrc
#QMAKE_INFO_PLIST += Info.plist.in
