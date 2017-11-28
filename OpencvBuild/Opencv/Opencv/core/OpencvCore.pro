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

DIR_DEPEND_ZLIB_DEST =$$PWD/../3rdparty/Lib/$${DIR_PLATFORM}/$${DIR_COMPILER}/$${DIR_COMPILEMODE}/
#DIR_DEPEND_ZLIB_DEST =$$PWD/../3rdparty/Lib/Linux64/GCC/$${DIR_COMPILEMODE}
PRE_TARGETDEPS  += $${DIR_DEPEND_ZLIB_DEST}/libzlib$${FILE_POSTFIX}$${FILE_LIB_EXT}

#QMAKE_LIBDIR += -ldl


message($${DIR_DEPEND_ZLIB_DEST})
