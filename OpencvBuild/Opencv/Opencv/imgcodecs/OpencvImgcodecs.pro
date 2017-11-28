include ($$PWD/../opencv.pri)


TEMPLATE    = lib

TARGET  = opencvImgCodecs$${FILE_POSTFIX}

INCLUDEPATH +=$$PWD/../core/include
INCLUDEPATH +=$$PWD/include

DIR_DEPEND_3RDPARTY_DEST=$$PWD/../3rdparty
# openexr lib
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/openexr/Half
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/openexr/Iex
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/openexr/IlmImf
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/openexr/Imath
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/libjpeg
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/libjasper
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/libpng
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/libtiff
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/include
INCLUDEPATH +=$${DIR_DEPEND_3RDPARTY_DEST}/include/tifconfig/$${DIR_PLATFORM}/$${DIR_COMPILER}

DIR_DEPEND_3RDPARTY_DEST=$$PWD/../3rdparty/Lib
LIBS += -L$${DIR_DEPEND_3RDPARTY_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopenexr$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_3RDPARTY_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -ljpeg$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_3RDPARTY_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -ljasper$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_3RDPARTY_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lpng$${FILE_POSTFIX}
LIBS += -L$${DIR_DEPEND_3RDPARTY_DEST}/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -ltiff$${FILE_POSTFIX}


SOURCES += \
    src/bitstrm.cpp \
    src/grfmt_base.cpp \
    src/grfmt_bmp.cpp \
    src/grfmt_exr.cpp \
    src/grfmt_gdal.cpp \
    src/grfmt_hdr.cpp \
    src/grfmt_jpeg.cpp \
    src/grfmt_jpeg2000.cpp \
    src/grfmt_png.cpp \
    src/grfmt_pxm.cpp \
    src/grfmt_sunras.cpp \
    src/grfmt_tiff.cpp \
    src/grfmt_webp.cpp \
    src/jpeg_exif.cpp \
    src/loadsave.cpp \
    src/rgbe.cpp \
    src/utils.cpp


