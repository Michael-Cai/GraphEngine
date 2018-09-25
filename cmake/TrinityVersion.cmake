IF(${TRINITY_VERSION})
    RETURN()
ENDIF()

EXECUTE_PROCESS(
    COMMAND ${DOTNET_EXE} help # to avoid "FIRST RUN EXPERIENCE" leaking into our version string
    OUTPUT_QUIET
    ERROR_QUIET)

EXECUTE_PROCESS(
    COMMAND ${DOTNET_EXE} run -p ${CMAKE_CURRENT_LIST_DIR}/../tools/versioning/versioning.csproj
    OUTPUT_VARIABLE TRINITY_VERSION 
    OUTPUT_STRIP_TRAILING_WHITESPACE)

IF(TRINITY_VERSION STREQUAL "")
    SET(TRINITY_VERSION 0)
ENDIF()

SET(TRINITY_VERSION "2.0.${TRINITY_VERSION}")
MESSAGE("-- GraphEngine version is now ${TRINITY_VERSION}")
