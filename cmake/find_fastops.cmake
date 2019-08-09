option (ENABLE_FASTOPS "Enable fast vectorized mathematical functions library by Mikhail Parakhin" ${NOT_UNBUNDLED})

if (ENABLE_FASTOPS)
    if(NOT EXISTS "${ClickHouse_SOURCE_DIR}/contrib/fastops/fastops/fastops.h")
        message(FATAL_ERROR "submodule contrib/fastops is missing. to fix try run: \n git submodule update --init --recursive")
        set(USE_FASTOPS 0)
    endif()
    set (USE_FASTOPS 1)
    set (FASTOPS_INCLUDE_DIR ${ClickHouse_SOURCE_DIR}/contrib/fastops/)
    set (FASTOPS_LIBRARY fastops)
else ()
    set(USE_FASTOPS 0)
endif ()

message (STATUS "Using fastops")
