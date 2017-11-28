include ($$PWD/../3rdparty.pri)

TEMPLATE    = lib
TARGET  = tiff$${FILE_POSTFIX}

INCLUDEPATH += $$PWD/../include

INCLUDEPATH += $$PWD/../include/tifconfig/$${DIR_PLATFORM}/$${DIR_COMPILER}

SOURCES += \
    tif_stream.cxx \
    tif_aux.c \
    tif_close.c \
    tif_codec.c \
    tif_color.c \
    tif_compress.c \
    tif_dir.c \
    tif_dirinfo.c \
    tif_dirread.c \
    tif_dirwrite.c \
    tif_dumpmode.c \
    tif_error.c \
    tif_extension.c \
    tif_fax3.c \
    tif_fax3sm.c \
    tif_flush.c \
    tif_getimage.c \
    tif_jbig.c \
    tif_jpeg.c \
    tif_jpeg_12.c \
    tif_luv.c \
    tif_lzma.c \
    tif_lzw.c \
    tif_next.c \
    tif_ojpeg.c \
    tif_open.c \
    tif_packbits.c \
    tif_pixarlog.c \
    tif_predict.c \
    tif_print.c \
    tif_read.c \
    tif_strip.c \
    tif_swab.c \
    tif_thunder.c \
    tif_tile.c \
    tif_version.c \
    tif_warning.c \
    tif_write.c \
    tif_zip.c

win32:{
    SOURCES +=$$PWD/tif_win32.c
}
linux:{
    SOURCES +=$$PWD/tif_unix.c
}

