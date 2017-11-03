include ($$PWD/../opencv.pri)


TEMPLATE    = lib

TARGET  = opencvImgProc$${FILE_POSTFIX}

# core file
INCLUDEPATH +=$$PWD/../core/include

# build modules
INCLUDEPATH +=$$PWD/../../Include/opencv2
INCLUDEPATH +=$$PWD/../../Include/modules/imgproc

# imgproc file
INCLUDEPATH +=$$PWD/include

DEFINES +=__OPENCV_BUILD

HEADERS += \
    src/_geom.h \
    src/filterengine.hpp \
    src/gcgraph.hpp \
    src/precomp.hpp

SOURCES += \
    src/accum.cpp \
    src/approx.cpp \
    src/blend.cpp \
    src/canny.cpp \
    src/clahe.cpp \
    src/color.cpp \
    src/colormap.cpp \
    src/connectedcomponents.cpp \
    src/contours.cpp \
    src/convhull.cpp \
    src/corner.cpp \
    src/cornersubpix.cpp \
    src/demosaicing.cpp \
    src/deriv.cpp \
    src/distransform.cpp \
    src/drawing.cpp \
    src/emd.cpp \
    src/featureselect.cpp \
    src/filter.cpp \
    src/floodfill.cpp \
    src/gabor.cpp \
    src/generalized_hough.cpp \
    src/geometry.cpp \
    src/grabcut.cpp \
    src/hershey_fonts.cpp \
    src/histogram.cpp \
    src/hough.cpp \
    src/imgwarp.cpp \
    src/intersection.cpp \
    src/linefit.cpp \
    src/lsd.cpp \
    src/main.cpp \
    src/matchcontours.cpp \
    src/min_enclosing_triangle.cpp \
    src/moments.cpp \
    src/morph.cpp \
    src/phasecorr.cpp \
    src/pyramids.cpp \
    src/rotcalipers.cpp \
    src/samplers.cpp \
    src/segmentation.cpp \
    src/shapedescr.cpp \
    src/smooth.cpp \
    src/spatialgradient.cpp \
    src/subdivision2d.cpp \
    src/sumpixels.cpp \
    src/tables.cpp \
    src/templmatch.cpp \
    src/thresh.cpp \
    src/undistort.cpp \
    src/utils.cpp


