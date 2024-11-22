cmake_minimum_required(VERSION 3.30)
project(test_interface)

add_library(test_interface INTERFACE)
add_library(test_interface::test_interface ALIAS test_interface)

target_compile_features(test_interface INTERFACE cxx_std_20)

target_include_directories(
    test_interface INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

install(TARGETS test_interface EXPORT test_interface-config)
install(
    EXPORT test_interface-config
        NAMESPACE test_interface::
        DESTINATION lib/cmake
)
#        DESTINATION lib/cmake/test_interface
install(
    DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/
    DESTINATION include
)