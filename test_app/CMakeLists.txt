cmake_minimum_required(VERSION 3.30)
set(CMAKE_CXX_STANDARD 20)
project(test_app)

find_package(test_depending)

add_executable(test_app src/main.cpp)
target_link_libraries(test_app PUBLIC test_depending::test_depending)

