add_library(test_depending STATIC include/test_depending/test_depending.h src/test_depending.cpp src/test_private.h src/test_private.cpp)
add_library(test_depending::test_depending ALIAS test_depending)

find_package(test_static)
find_package(test_interface)

target_link_libraries(
    test_depending
        PRIVATE
            test_static::test_static
            test_interface::test_interface
)

target_include_directories(
    test_depending
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
            $<INSTALL_INTERFACE:include>    
)

install(
    TARGETS test_depending
        EXPORT test_depending-config
        ARCHIVE DESTINATION lib/$<CONFIGURATION>
)
install(
    DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/
    DESTINATION include
)
install(
    EXPORT test_depending-config
        NAMESPACE test_depending::
        DESTINATION lib/cmake
        EXPORT_PACKAGE_DEPENDENCIES
)
#        DESTINATION lib/cmake/test_depending
