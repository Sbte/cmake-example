cmake_minimum_required(VERSION 2.8)
project(B CXX)

set(BUILD_SHARED_LIBS ON)

find_package(A)

add_library(B B)
target_link_libraries(B ${A_LIBRARIES})

add_executable(B_main main.cc)
target_link_libraries(B_main B)

set(INCLUDE_INSTALL_DIR include)
set(LIB_INSTALL_DIR lib)

install(TARGETS B EXPORT BTargets LIBRARY DESTINATION ${LIB_INSTALL_DIR})

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/B/BConfigVersion.cmake"
  VERSION 0 COMPATIBILITY SameMajorVersion
  )

set(ConfigPackageLocation lib/cmake/B)
configure_package_config_file("${PROJECT_SOURCE_DIR}/BConfig.cmake.in"
  "${PROJECT_BINARY_DIR}/BConfig.cmake" INSTALL_DESTINATION ${ConfigPackageLocation}
  PATH_VARS INCLUDE_INSTALL_DIR)

install(EXPORT BTargets FILE BTargets.cmake DESTINATION ${ConfigPackageLocation})
install(FILES "${PROJECT_BINARY_DIR}/BConfig.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/B/BConfigVersion.cmake"
  DESTINATION ${ConfigPackageLocation}
  )