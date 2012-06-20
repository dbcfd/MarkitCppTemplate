# - Try to find Some Markit Library
#
#  This module defines the following variables
#
#  SomeMarkitLibrary_FOUND - Was library found
#  SomeMarkitLibrary_INCLUDE_DIRS - the include directories
#  SomeMarkitLibrary_LIBRARIES - Required libraries
#
#  This module accepts the following variables
#
#  SomeMarkitLibrary_DIR - Set to location of SomeMarkitLibrary if not in PATH or current directory ThirdParty
#

macro(_FIND_SML_LIBRARY _var)
  find_library(${_var}
     NAMES 
        ${ARGN}
     HINTS
        ${SomeMarkitLibrary_DIR}/lib
		${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/lib
     PATH_SUFFIXES lib
  )
  mark_as_advanced(${_var})
endmacro()

macro(_SML_APPEND_LIBRARIES _list _release)
   set(_debug ${_release}_DEBUG)
   if(${_debug})
      set(${_list} ${${_list}} optimized ${${_release}} debug ${${_debug}})
   else()
      set(${_list} ${${_list}} ${${_release}})
   endif()
endmacro()

macro(_SML_FIND_HEADER _include_dir)
	find_path(include_dir NAMES SomeMarkitLibrary.h
		HINTS
			${SomeMarkitLibrary_DIR}/include
			${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/include
		PATH_SUFFIXES SomeMarkitLibrary
	)
	set(${_include_dir} ${include_dir}
endmacro()

# Find the libraries

_FIND_SML_LIBRARY(SomeMarkitLibrary_LIBRARY        SomeMarkitLibrary)
_FIND_SML_LIBRARY(SomeMarkitLibrary_LIBRARY_DEBUG  SomeMarkitLibrary_d)

# Find the headers
_FIND_SML_HEADER(SomeMarkitLibrary_INCLUDE_DIR)


# handle the QUIETLY and REQUIRED arguments and set SomeMarkitLibrary_FOUND to TRUE if 
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SomeMarkitLibrary DEFAULT_MSG
    SomeMarkitLibrary_LIBRARY SomeMarkitLibrary_INCLUDE_DIR)

if(SomeMarkitLibrary_FOUND)
   _SML_APPEND_LIBRARIES(SomeMarkitLibrary_LIBRARIES SomeMarkitLibrary_LIBRARY)
else if(SomeMarkitLibrary_CHECKOUT_LOCATION)
	set(checkout_command "git clone https://github.com/dbcfd/SomeMarkitLibrary.git")
	execute_process(COMMAND ${checkout_command} ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/SomeMarkitLibrary)
	_FIND_SML_HEADER(SomeMarkitLibrary_INCLUDE_DIR)
	if(SomeMarkitLibrary_INCLUDE_DIR)
		_FIND_SML_LIBRARY(SomeMarkitLibrary_LIBRARY        SomeMarkitLibrary)
		_FIND_SML_LIBRARY(SomeMarkitLibrary_LIBRARY_DEBUG  SomeMarkitLibrary_d)
		FIND_PACKAGE_HANDLE_STANDARD_ARGS(SomeMarkitLibrary DEFAULT_MSG
			SomeMarkitLibrary_LIBRARY SomeMarkitLibrary_INCLUDE_DIR)
	endif()
endif()

set(SomeMarkitLibrary_INCLUDE_DIRS ${SomeMarkitLibrary_INCLUDE_DIR})
