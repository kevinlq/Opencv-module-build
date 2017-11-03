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

#build file
INCLUDEPATH +=$$PWD/../build_file/imgproc

HEADERS += \
    ../imgproc/src/_geom.h \
    ../imgproc/src/filterengine.hpp \
    ../imgproc/src/gcgraph.hpp \
    ../imgproc/src/precomp.hpp

SOURCES += \
    ../imgproc/src/accum.cpp \
    ../imgproc/src/approx.cpp \
    ../imgproc/src/blend.cpp \
    ../imgproc/src/canny.cpp \
    ../imgproc/src/clahe.cpp \
    ../imgproc/src/color.cpp \
    ../imgproc/src/colormap.cpp \
    ../imgproc/src/connectedcomponents.cpp \
    ../imgproc/src/contours.cpp \
    ../imgproc/src/convhull.cpp \
    ../imgproc/src/corner.cpp \
    ../imgproc/src/cornersubpix.cpp \
    ../imgproc/src/demosaicing.cpp \
    ../imgproc/src/deriv.cpp \
    ../imgproc/src/distransform.cpp \
    ../imgproc/src/drawing.cpp \
    ../imgproc/src/emd.cpp \
    ../imgproc/src/featureselect.cpp \
    ../imgproc/src/filter.cpp \
    ../imgproc/src/floodfill.cpp \
    ../imgproc/src/gabor.cpp \
    ../imgproc/src/generalized_hough.cpp \
    ../imgproc/src/geometry.cpp \
    ../imgproc/src/grabcut.cpp \
    ../imgproc/src/hershey_fonts.cpp \
    ../imgproc/src/histogram.cpp \
    ../imgproc/src/hough.cpp \
    ../imgproc/src/imgwarp.cpp \
    ../imgproc/src/intersection.cpp \
    ../imgproc/src/linefit.cpp \
    ../imgproc/src/lsd.cpp \
    ../imgproc/src/main.cpp \
    ../imgproc/src/matchcontours.cpp \
    ../imgproc/src/min_enclosing_triangle.cpp \
    ../imgproc/src/moments.cpp \
    ../imgproc/src/morph.cpp \
    ../imgproc/src/phasecorr.cpp \
    ../imgproc/src/pyramids.cpp \
    ../imgproc/src/rotcalipers.cpp \
    ../imgproc/src/samplers.cpp \
    ../imgproc/src/segmentation.cpp \
    ../imgproc/src/shapedescr.cpp \
    ../imgproc/src/smooth.cpp \
    ../imgproc/src/spatialgradient.cpp \
    ../imgproc/src/subdivision2d.cpp \
    ../imgproc/src/sumpixels.cpp \
    ../imgproc/src/tables.cpp \
    ../imgproc/src/templmatch.cpp \
    ../imgproc/src/thresh.cpp \
    ../imgproc/src/undistort.cpp \
    ../imgproc/src/utils.cpp
