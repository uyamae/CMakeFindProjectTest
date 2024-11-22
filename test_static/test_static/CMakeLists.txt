add_library(test_static include/test_static.h src/test_static.cpp src/test_private.h src/test_private.cpp)
target_include_directories(
    test_static
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/test_static>
            $<INSTALL_INTERFACE:include/test_static>
)

install(
    TARGETS test_static
        EXPORT test_static-config
        ARCHIVE DESTINATION lib
)
install(
    DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/
    DESTINATION include
)
install(
    EXPORT test_static-config
        NAMESPACE test_static::
        DESTINATION lib/cmake/test_static
)
