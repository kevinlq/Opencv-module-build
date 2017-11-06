TEMPLATE = subdirs

SUBDIRS += \
    $$PWD/3rdparty/3rdparty.pro \
    $$PWD/core/OpencvCore.pro \
    $$PWD/imgproc/OpencvImgproc.pro \
    $$PWD/imgcodecs/OpencvImgcodecs.pro

CONFIG  +=order

