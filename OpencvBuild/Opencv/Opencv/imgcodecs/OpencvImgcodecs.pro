include ($$PWD/../opencv.pri)


TEMPLATE    = lib

TARGET  = opencvImgCodecs$${FILE_POSTFIX}

INCLUDEPATH +=$$PWD/../core/include
INCLUDEPATH +=$$PWD/include

# openexr lib
INCLUDEPATH +=$$PWD/../3rdparty/openexr/Half
INCLUDEPATH +=$$PWD/../3rdparty/openexr/Iex
INCLUDEPATH +=$$PWD/../3rdparty/openexr/IlmImf
INCLUDEPATH +=$$PWD/../3rdparty/openexr/Imath
LIBS += -L$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lopenexr$${FILE_POSTFIX}

#jpeg lib
INCLUDEPATH +=$$PWD/../3rdparty/libjpeg
LIBS += -L$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -ljpeg$${FILE_POSTFIX}

# jasper lib
INCLUDEPATH +=$$PWD/../3rdparty/libjasper
LIBS += -L$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -ljasper$${FILE_POSTFIX}

# png lib
INCLUDEPATH +=$$PWD/../3rdparty/libpng
LIBS += -L$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lpng$${FILE_POSTFIX}

# tiff lib
INCLUDEPATH +=$$PWD/../3rdparty/libtiff
LIBS += -L$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -ltiff$${FILE_POSTFIX}
INCLUDEPATH +=$$PWD/../3rdparty/include

HEADERS += \
    src/bitstrm.hpp \
    src/grfmt_base.hpp \
    src/grfmt_bmp.hpp \
    src/grfmt_exr.hpp \
    src/grfmt_gdal.hpp \
    src/grfmt_hdr.hpp \
    src/grfmt_jpeg.hpp \
    src/grfmt_jpeg2000.hpp \
    src/grfmt_png.hpp \
    src/grfmt_pxm.hpp \
    src/grfmt_sunras.hpp \
    src/grfmt_tiff.hpp \
    src/grfmt_webp.hpp \
    src/grfmts.hpp \
    src/jpeg_exif.hpp \
    src/precomp.hpp \
    src/rgbe.hpp \
    src/utils.hpp

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


