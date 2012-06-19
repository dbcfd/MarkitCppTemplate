set (TARGET Application)

file(GLOB HEADERS "*.h")

file(GLOB SOURCES "*.cpp")

SET (DEPENDENCIES ${DEPENDENCIES} ModuleA ModuleB)

add_executable (${TARGET} ${HEADERS} ${SOURCES}) 
target_link_libraries (${TARGET} ${DEPENDENCIES})

install (TARGETS ${TARGET} RUNTIME DESTINATION bin LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)

SetVSTargetProperties(${TARGET})