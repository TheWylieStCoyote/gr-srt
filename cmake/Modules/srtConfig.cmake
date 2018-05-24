INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_SRT srt)

FIND_PATH(
    SRT_INCLUDE_DIRS
    NAMES srt/api.h
    HINTS $ENV{SRT_DIR}/include
        ${PC_SRT_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    SRT_LIBRARIES
    NAMES gnuradio-srt
    HINTS $ENV{SRT_DIR}/lib
        ${PC_SRT_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SRT DEFAULT_MSG SRT_LIBRARIES SRT_INCLUDE_DIRS)
MARK_AS_ADVANCED(SRT_LIBRARIES SRT_INCLUDE_DIRS)

