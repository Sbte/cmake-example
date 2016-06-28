cmake_minimum_required(VERSION 2.8)
project(A CXX)

set(BUILD_SHARED_LIBS ON)

add_library(A A)

set(INCLUDE_INSTALL_DIR include)
set(LIB_INSTALL_DIR lib)

install(TARGETS A EXPORT ATargets LIBRARY DESTINATION ${LIB_INSTALL_DIR})

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/A/AConfigVersion.cmake"
  VERSION 0 COMPATIBILITY SameMajorVersion
  )

set(ConfigPackageLocation lib/cmake/A)
configure_package_config_file("${PROJECT_SOURCE_DIR}/AConfig.cmake.in"
  "${PROJECT_BINARY_DIR}/AConfig.cmake" INSTALL_DESTINATION ${ConfigPackageLocation}
  PATH_VARS INCLUDE_INSTALL_DIR)

install(EXPORT ATargets FILE ATargets.cmake DESTINATION ${ConfigPackageLocation})
install(FILES "${PROJECT_BINARY_DIR}/AConfig.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/A/AConfigVersion.cmake"
  DESTINATION ${ConfigPackageLocation}
  )