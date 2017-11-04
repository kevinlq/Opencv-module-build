TEMPLATE = subdirs

SUBDIRS += \
    $$PWD/zlib/OpencvZlib.pro \
    $$PWD/libpng/OpencvLibPng.pro \
    $$PWD/libjpeg/OpencvLibJpeg.pro \
    $$PWD/libtiff/OpencvLibTiff.pro \
    $$PWD/libjasper/OpencvLibJasper.pro

CONFIG  +=order
