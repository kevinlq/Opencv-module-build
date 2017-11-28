include ($$PWD/../opencv.pri)


TEMPLATE    = lib

TARGET  = videoio$${FILE_POSTFIX}

DEFINES -=UNICODE

INCLUDEPATH +=$$PWD/include
INCLUDEPATH +=$$PWD/../core/include
INCLUDEPATH +=$$PWD/../imgcodecs/include
INCLUDEPATH +=$$PWD/../3rdparty/include


SOURCES += \
    src/cap.cpp \
    src/cap_cmu.cpp \
    src/cap_dc1394.cpp \
    src/cap_dc1394_v2.cpp \
    src/cap_dshow.cpp \
    src/cap_ffmpeg.cpp \
#    src/cap_giganetix.cpp \
    src/cap_gphoto2.cpp \
#    src/cap_gstreamer.cpp \
    src/cap_images.cpp \
    src/cap_intelperc.cpp \
    src/cap_libv4l.cpp \
    src/cap_mjpeg_decoder.cpp \
    src/cap_mjpeg_encoder.cpp \
    src/cap_msmf.cpp \
    src/cap_openni.cpp \
    src/cap_openni2.cpp \
    src/cap_pvapi.cpp \
#    src/cap_qt.cpp \
#    src/cap_unicap.cpp \
    src/cap_v4l.cpp \
    src/cap_vfw.cpp \
#    src/cap_winrt_bridge.cpp \
#    src/cap_winrt_capture.cpp \
#    src/cap_winrt_video.cpp \
#    src/cap_ximea.cpp \
#    src/cap_xine.cpp
