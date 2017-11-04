#-------------------------------------------------
#
# Project created by QtCreator 2017-11-02T22:23:17
#
#-------------------------------------------------

include ($$PWD/test.pri)

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

INCLUDEPATH +=$$PWD/../Opencv/Opencv/core/include
INCLUDEPATH +=$$PWD/../Opencv/Opencv/imgproc/include

LIBS += -L$$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lzlib$${FILE_POSTFIX}
LIBS += -L$$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvCore$${FILE_POSTFIX}
LIBS += -L$$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvImgProc$${FILE_POSTFIX}



TARGET = Test
TEMPLATE = app

SOURCES += \
    main.cpp
