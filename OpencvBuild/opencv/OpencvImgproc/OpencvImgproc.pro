include ($$PWD/OpencvImgProc.pri)

TEMPLATE    = lib
TARGET  = opencvImgProc$${FILE_POSTFIX}

#core file
INCLUDEPATH +=$$PWD/../core/include
INCLUDEPATH +=$$PWD/../core/include/opencv2
#INCLUDEPATH +=$$PWD/core/include/opencv2/core

#imgproc file
#INCLUDEPATH +=$$PWD/../imgproc/include/opencv2/imgproc
#INCLUDEPATH +=$$PWD/../imgproc/include/opencv2/
#INCLUDEPATH +=$$PWD/../imgproc/include
#INCLUDEPATH +=$$PWD/../imgproc/perf
INCLUDEPATH +=$$PWD/../imgproc/include
