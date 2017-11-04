TEMPLATE = subdirs

SUBDIRS += \
#    $$PWD/3rdparty/3rdparty.pro \
    $$PWD/3rdparty/zlib-1.2.11/zlib.pro \
    $$PWD/core/OpencvCore.pro \
    $$PWD/imgproc/OpencvImgproc.pro

CONFIG  +=order

