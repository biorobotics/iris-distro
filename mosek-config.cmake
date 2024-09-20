# if pasted into a folder that contains the uncompressed mosek download, serves as a package config file.
# You will need to add the folder containing both this file and mosek to CMake's search path, e.g. by updating the User Package Registry
# On UNIX: 
#mkdir -p ~/.cmake/packages/Mosek/
#echo /path/to/folder/containing/this/file > ~/.cmake/packages/Mosek/mosek
#
# then find_package(Mosek) will define
#
# MOSEK_FOUND           - system has MOSEK
# MOSEK_INCLUDE_DIRS    - the MOSEK include directories
# MOSEK_LIBRARIES       - Link these to use MOSEK
#

SET(MOSEK_INCLUDE_DIRS ${CMAKE_CURRENT_LIST_DIR}/mosek/10.2/tools/platform/linux64x86/h)

SET(SEARCH_PATHS "${MOSEK_INCLUDE_DIRs}" "${MOSEK_INCLUDE_DIRs}/../bin")

set(MOSEK_LIBRARIES)
FIND_LIBRARY(MOSEK_LIBRARIES  NAMES libmosek64.so PATHS ${CMAKE_CURRENT_LIST_DIR}/mosek/10.2/tools/platform/linux64x86/bin)

if(MOSEK_LIBRARIES AND MOSEK_INCLUDE_DIRS)
set(MOSEK_FOUND TRUE)
endif(MOSEK_LIBRARIES AND MOSEK_INCLUDE_DIRS)

IF (MOSEK_FOUND)
   message(STATUS "Found MOSEK: ${MOSEK_INCLUDE_DIRS}")
ELSE (MOSEK_FOUND)
    message(WARNING "could NOT find MOSEK")
ENDIF (MOSEK_FOUND)
