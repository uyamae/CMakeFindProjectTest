add_library(test_static STATIC include/test_static/test_static.h src/test_static.cpp src/test_private.h src/test_private.cpp)
add_library(test_static::test_static ALIAS test_static)

target_include_directories(
    test_static
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
            $<INSTALL_INTERFACE:include>
)

install(
    TARGETS test_static
        EXPORT test_static-config
        ARCHIVE DESTINATION lib/$<CONFIGURATION>
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
