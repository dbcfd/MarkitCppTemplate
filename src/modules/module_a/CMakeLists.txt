set (TARGET ModuleA)
add_definitions(-DMODULE_A_BUILD)

file(GLOB HEADERS "*.h")

file(GLOB SOURCES "*.cpp")

set(DCL_VERSION 8.1.2)
find_package(DCL REQUIRED)

set(DEPENDENCIES ${DEPENDENCIES} ${DCL_LIBRARIES})

add_library (${TARGET} SHARED ${HEADERS} ${SOURCES}) 
target_link_libraries (${TARGET} ${DEPENDENCIES})

set_target_properties (${TARGET} PROPERTIES
    SOVERSION ${PROJECT_SO_VERSION})

install (TARGETS ${TARGET} RUNTIME DESTINATION bin LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)

SetVSTargetProperties(${TARGET})