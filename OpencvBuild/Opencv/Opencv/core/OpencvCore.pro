include ($$PWD/../opencv.pri)


TEMPLATE    = lib

TARGET  = opencvCore$${FILE_POSTFIX}

# 3rdparty file
INCLUDEPATH +=$$PWD/../3rdparty/include/opencl/1.2
INCLUDEPATH +=$$PWD/../3rdparty/zlib
LIBS += -L$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/ -lzlib$${FILE_POSTFIX}


# include opencv core include
INCLUDEPATH +=$$PWD/include
INCLUDEPATH +=$$PWD/include/opencv2

# this is zlib file
HEADERS += \
    $$PWD/../3rdparty/zlib/crc32.h \
    $$PWD/../3rdparty/zlib/deflate.h \
    $$PWD/../3rdparty/zlib/gzguts.h \
    $$PWD/../3rdparty/zlib/inffast.h \
    $$PWD/../3rdparty/zlib/inffixed.h \
    $$PWD/../3rdparty/zlib/inflate.h \
    $$PWD/../3rdparty/zlib/inftrees.h \
    $$PWD/../3rdparty/zlib/trees.h \
    $$PWD/../3rdparty/zlib/zlib.h \
    $$PWD/../3rdparty/zlib/zutil.h \
    $$PWD/../3rdparty/zlib/zconf.h

SOURCES += \
    $$PWD/../3rdparty/zlib/adler32.c \
    $$PWD/../3rdparty/zlib/compress.c \
    $$PWD/../3rdparty/zlib/crc32.c \
    $$PWD/../3rdparty/zlib/deflate.c \
    $$PWD/../3rdparty/zlib/gzclose.c \
    $$PWD/../3rdparty/zlib/gzlib.c \
    $$PWD/../3rdparty/zlib/gzread.c \
    $$PWD/../3rdparty/zlib/gzwrite.c \
    $$PWD/../3rdparty/zlib/infback.c \
    $$PWD/../3rdparty/zlib/inffast.c \
    $$PWD/../3rdparty/zlib/inflate.c \
    $$PWD/../3rdparty/zlib/inftrees.c \
    $$PWD/../3rdparty/zlib/trees.c \
    $$PWD/../3rdparty/zlib/uncompr.c \
    $$PWD/../3rdparty/zlib/zutil.c


HEADERS += \
    src/arithm_core.hpp \
    src/arithm_simd.hpp \
    src/bufferpool.impl.hpp \
    src/directx.inc.hpp \
    src/gl_core_3_1.hpp \
    src/hal_replacement.hpp \
    src/precomp.hpp \
    codedef.h

SOURCES += \
    src/algorithm.cpp \
    src/alloc.cpp \
    src/arithm.cpp \
    src/array.cpp \
    src/command_line_parser.cpp \
    src/conjugate_gradient.cpp \
    src/convert.cpp \
    src/copy.cpp \
    src/cuda_gpu_mat.cpp \
    src/cuda_host_mem.cpp \
    src/cuda_info.cpp \
    src/cuda_stream.cpp \
    src/datastructs.cpp \
    src/directx.cpp \
    src/downhill_simplex.cpp \
    src/dxt.cpp \
    src/gl_core_3_1.cpp \
    src/glob.cpp \
    src/kmeans.cpp \
    src/lapack.cpp \
    src/lda.cpp \
    src/lpsolver.cpp \
    src/mathfuncs.cpp \
    src/mathfuncs_core.cpp \
    src/matmul.cpp \
    src/matop.cpp \
    src/matrix.cpp \
    src/matrix_decomp.cpp \
    src/merge.cpp \
    src/ocl.cpp \
    src/opengl.cpp \
    src/out.cpp \
    src/parallel.cpp \
    src/parallel_pthreads.cpp \
    src/pca.cpp \
    src/persistence.cpp \
    src/rand.cpp \
    src/split.cpp \
    src/stat.cpp \
    src/stl.cpp \
    src/system.cpp \
    src/tables.cpp \
    src/types.cpp \
    src/umatrix.cpp \
    src/va_intel.cpp


message ($$QT_VERSION)
