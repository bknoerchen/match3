QT += core gui widgets quick quickwidgets

TARGET = Match3
TEMPLATE = app

CONFIG+=c++11
DEFINES += QT_DEPRECATED_WARNINGS

CONFIG(debug, debug|release) {
    DESTDIR = bin/debug
    OBJECTS_DIR = bin/debug/.obj
    MOC_DIR = bin/debug/.moc
    RCC_DIR = bin/debug/.rcc
    UI_DIR = bin/debug/.ui
} else {
    DESTDIR = bin/release
    OBJECTS_DIR = bin/release/.obj
    MOC_DIR = bin/release/.moc
    RCC_DIR = bin/release/.rcc
    UI_DIR = bin/release/.ui
}

QML_SRCDIR=$$PWD
DEFINES += QML_SRCDIR=\\\"$$QML_SRCDIR\\\"
#message($$DEFINES)

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    board.cpp \
    boarditem.cpp \
    quickwidget.cpp \
    boardcontroller.cpp

HEADERS += \
    mainwindow.h \
    board.h \
    boarditem.h \
    coordinate.h \
    quickwidget.h \
    global.h \
    boardcontroller.h

FORMS += \
    mainwindow.ui

DISTFILES += \
    qml/Board.qml \
    js/common.js

RESOURCES += \
    resource.qrc
