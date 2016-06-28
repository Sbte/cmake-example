cmake_minimum_required(VERSION 2.8)
project(B CXX)

set(BUILD_SHARED_LIBS ON)

find_package(B)

add_library(C C)
target_link_libraries(C ${B_LIBRARIES})

add_executable(C_main main.cc)
target_link_libraries(C_main C)