# - Try to find DCL
#
#  This module defines the following variables
#
#  DCL_FOUND - Was library found
#  DCL_INCLUDE_DIRS - the include directories
#  DCL_LIBRARIES - Required libraries
#
#  This module accepts the following variables
#
#  DCL_DIR - Set to location of DCL if not in PATH or current directory ThirdParty
#  DCL_VERSION - Version of DCL to look for
#  THIRDPARTY_DIR - Location of third party directory to perform checkouts int
#

macro(_FIND_DCL_LIBRARY _var)
  find_library(${_var}
     NAMES 
        ${ARGN}
     HINTS
        ${DCL_DIR}/lib
		${THIRDPARTY_DIR}/DCL/${DCL_VERSION}/lib
     PATH_SUFFIXES lib
  )
  mark_as_advanced(${_var})
endmacro()

macro(_DCL_APPEND_LIBRARIES _list _release)
   set(_debug ${_release}_DEBUG)
   if(${_debug})
      set(${_list} ${${_list}} optimized ${${_release}} debug ${${_debug}})
   else()
      set(${_list} ${${_list}} ${${_release}})
   endif()
endmacro()

macro(_FIND_DCL_HEADER _include_dir)
	find_path(dcl_include_dir NAMES DCL/DCL.h
		HINTS
			${DCL_DIR}/include
			${THIRDPARTY_DIR}/DCL/${DCL_VERSION}/include
	)
	set(${_include_dir} ${dcl_include_dir})
endmacro()

# Find the libraries

if(CMAKE_SIZEOF_VOID_P EQUAL 8) 
	_FIND_DCL_LIBRARY(DCL_LIBRARY        DCL_Lib_MT_64)
	_FIND_DCL_LIBRARY(DCL_LIBRARY_DEBUG  DCL_Lib_MTD_64)
else()
	_FIND_DCL_LIBRARY(DCL_LIBRARY        DCL_Lib_MT)
	_FIND_DCL_LIBRARY(DCL_LIBRARY_DEBUG  DCL_Lib_MTD)
endif()

# Find the headers
_FIND_DCL_HEADER(DCL_INCLUDE_DIR)

# handle the QUIETLY and REQUIRED arguments and set SomeMarkitLibrary_FOUND to TRUE if 
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
set(package_required ${DCL_FIND_REQUIRED})
set(package_quietly ${DCL_FIND_QUIETLY})
set(DCL_FIND_REQUIRED)
set(DCL_FIND_QUIETLY 1)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(DCL DEFAULT_MSG
    DCL_LIBRARY DCL_INCLUDE_DIR)
set(DCL_FIND_QUIETLY)

if(DCL_FOUND)
   _DCL_APPEND_LIBRARIES(DCL_LIBRARIES DCL_LIBRARY)
else()
	set(DCL_FIND_REQUIRED ${package_required})
	set(DCL_FIND_QUIETLY ${package_quietly})
	
	set(checkout_args export https://svn.wsod.local/svn/wsod/engineering/c++_lib_repository/DCL/8.1.2 ${THIRDPARTY_DIR}/DCL/8.1.2)
	execute_process(COMMAND svn ${checkout_args}  
		RESULT_VARIABLE coRes 
		OUTPUT_VARIABLE coOut
		ERROR_VARIABLE coErr)
	_FIND_DCL_HEADER(DCL_INCLUDE_DIR)
	if(CMAKE_SIZEOF_VOID_P EQUAL 8) 
		_FIND_DCL_LIBRARY(DCL_LIBRARY        DCL_Lib_MT_64)
		_FIND_DCL_LIBRARY(DCL_LIBRARY_DEBUG  DCL_Lib_MTD_64)
	else()
		_FIND_DCL_LIBRARY(DCL_LIBRARY        DCL_Lib_MT)
		_FIND_DCL_LIBRARY(DCL_LIBRARY_DEBUG  DCL_Lib_MTD)
	endif()
	FIND_PACKAGE_HANDLE_STANDARD_ARGS(DCL DEFAULT_MSG
		DCL_LIBRARY DCL_INCLUDE_DIR)
	_DCL_APPEND_LIBRARIES(DCL_LIBRARIES DCL_LIBRARY)
endif()

set(DCL_INCLUDE_DIRS ${DCL_INCLUDE_DIR})

include_directories(${DCL_INCLUDE_DIRS})
