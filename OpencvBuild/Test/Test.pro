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
INCLUDEPATH +=$$PWD/../Opencv/Opencv/imgcodecs/include
INCLUDEPATH +=$$PWD/ts/include

INCLUDEPATH +=$$PWD/../Highgui/Include

LIBS += -L$$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvCore$${FILE_POSTFIX}
LIBS += -L$$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvImgProc$${FILE_POSTFIX}
LIBS += -L$$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvImgCodecs$${FILE_POSTFIX}
#LIBS += -L D:/opencv/opencv-3.1.0/build_1104/install/x86/mingw/lib/libopencv_*.a

LIBS +=$$PWD/../Highgui/Lib/libopencv_imgcodecs310.dll.a
LIBS +=$$PWD/../Highgui/Lib/libopencv*.a



TARGET = Test
TEMPLATE = app

SOURCES += \
    main.cpp \
    imgproctest.cpp

HEADERS += \
    imgproctest.h
