include ($$PWD/../opencv.pri)


TEMPLATE    = lib

TARGET  = highgui$${FILE_POSTFIX}
DEFINES -=UNICODE

INCLUDEPATH +=$$PWD/src
INCLUDEPATH +=$$PWD/include
INCLUDEPATH +=$$PWD/../core/include
INCLUDEPATH +=$$PWD/../imgproc/include
INCLUDEPATH +=$$PWD/../imgcodecs/include
INCLUDEPATH +=$$PWD/../videoio/include

DIR_DEPEND_OPENCV_DEST = $$PWD/../../Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}

LIBS+=-L$${DIR_DEPEND_OPENCV_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvCore$${FILE_POSTFIX}
LIBS+=L$${DIR_DEPEND_OPENCV_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopencvImgProc$${FILE_POSTFIX}

SOURCES += \
    src/window.cpp \
#    src/window_carbon.cpp \
    src/window_gtk.cpp \
    src/window_QT.cpp \
#    src/window_winrt.cpp \
#    src/window_winrt_bridge.cpp

win32:{
    SOURCES +=$$PWD/src/window_w32.cpp
}

PRE_TARGETDEPS += $${DIR_DEPEND_OPENCV_DEST}/$${FILE_LIB_PREFIX}opencvCore$${FILE_POSTFIX}$${FILE_LIB_EXT}
PRE_TARGETDEPS += $${DIR_DEPEND_OPENCV_DEST}/$${FILE_LIB_PREFIX}opencvImgProc$${FILE_POSTFIX}$${FILE_LIB_EXT}
