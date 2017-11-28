#-------------------------------------------------
#
# Project created by QtCreator 2017-11-02T22:23:17
#
#-------------------------------------------------

include ($$PWD/test.pri)

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Test
TEMPLATE = app


INCLUDEPATH +=$$PWD/../Opencv/Opencv/core/include
INCLUDEPATH +=$$PWD/../Opencv/Opencv/imgproc/include
INCLUDEPATH +=$$PWD/../Opencv/Opencv/imgcodecs/include
INCLUDEPATH +=$$PWD/../Opencv/Opencv/videoio/include
INCLUDEPATH +=$$PWD/../Opencv/Opencv/highgui/include



#LIBS +=$$PWD/../Highgui/Lib/libopencv_highgui310.dll.a
#LIBS +=$$PWD/../Highgui/Lib/libopencv_imgcodecs310.dll.a
#LIBS +=$$PWD/../Highgui/Lib/libopencv*.a

DIR_DEPEND_OPENCV_DEST = $$PWD/../Opencv/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/
DIR_DEPEND_3RD_DEST    = $$PWD/../Opencv/Opencv/3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/

LIBS += -L$${DIR_DEPEND_OPENCV_DEST} -lopencvImgProc$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_OPENCV_DEST} -lopencvCore$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_OPENCV_DEST} -lopencvImgCodecs$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_OPENCV_DEST} -lhighgui$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_3RD_DEST} -lzlib$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_3RD_DEST} -ltiff$${FILE_POSTFIX}
linux:{
LIBS  +=-ldl
}


PRE_TARGETDEPS += $${DIR_DEPEND_OPENCV_DEST}/$${FILE_LIB_PREFIX}opencvCore$${FILE_POSTFIX}$${FILE_LIB_EXT}
PRE_TARGETDEPS += $${DIR_DEPEND_OPENCV_DEST}/$${FILE_LIB_PREFIX}opencvImgProc$${FILE_POSTFIX}$${FILE_LIB_EXT}
PRE_TARGETDEPS += $${DIR_DEPEND_OPENCV_DEST}/$${FILE_LIB_PREFIX}highgui$${FILE_POSTFIX}$${FILE_LIB_EXT}


SOURCES += \
    main.cpp

SOURCES +=\
    imgproctest.cpp

HEADERS += \
    imgproctest.h

