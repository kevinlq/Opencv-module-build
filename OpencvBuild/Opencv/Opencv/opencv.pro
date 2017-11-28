TEMPLATE = subdirs

SUBDIRS += \
    $$PWD/3rdparty/3rdparty.pro \
    $$PWD/core/opencvCore.pro \
    $$PWD/imgproc/opencvImgproc.pro \
    $$PWD/imgcodecs/opencvImgcodecs.pro \
    $$PWD/highgui/opencvHighgui.pro


CONFIG  +=order

