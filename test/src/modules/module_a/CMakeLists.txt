add_definitions(-DGTEST_LINKED_AS_SHARED_LIBRARY)

set (TARGET TestModuleA)

file(GLOB SOURCES "*.cpp")

if(UNIX)
	set(DEPENDENCIES rt)
endif()	

find_package(gtest REQUIRED)

SET (DEPENDENCIES ${DEPENDENCIES} ModuleA gtest)

add_executable (${TARGET} ${HEADERS} ${SOURCES}) 
target_link_libraries (${TARGET} ${DEPENDENCIES})

install (TARGETS ${TARGET} RUNTIME DESTINATION bin LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)

SetVSTargetProperties(${TARGET})