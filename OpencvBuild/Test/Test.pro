#-------------------------------------------------
#
# Project created by QtCreator 2017-11-02T22:23:17
#
#-------------------------------------------------

include ($$PWD/test.pri)

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

INCLUDEPATH +=$$PWD/../Opencv/Opencv/core/include

TARGET = Test
TEMPLATE = app

SOURCES += \
    main.cpp
