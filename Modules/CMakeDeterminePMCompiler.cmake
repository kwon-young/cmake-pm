# CMake PM - PM language support for CMake
# Copyright (C) 2014 offa
#
# This file is part of CMake PM.
#
# CMake PM is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# CMake PM is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CMake PM. If not, see <http://www.gnu.org/licenses/>.

include(CMakeDetermineCompiler)
include(Platform/${CMAKE_SYSTEM_NAME}-PM OPTIONAL)

if( NOT CMAKE_PM_COMPILER_NAMES )
  set(CMAKE_PM_COMPILER_NAMES pmc)
endif()

if( NOT CMAKE_PM_COMPILER )
  set(CMAKE_PM_COMPILER_INIT NOTFOUND)

  if( $ENV{PMDIR} MATCHES ".+" )
    get_filename_component(CMAKE_PM_COMPILER_INIT $ENV{PMDIR}/bin/pmc PROGRAM PROGRAM_ARGS CMAKE_PM_FLAGS_ENV_INIT)

    if(NOT EXISTS ${CMAKE_PM_COMPILER_INIT})
      message(FATAL_ERROR "Could not find compiler set in environment variable PM:\n$ENV{PMDIR}.")
    endif()
  endif()

  _cmake_find_compiler(PM)
endif()

set(CMAKE_PM_COMPILER ${CMAKE_PM_COMPILER} CACHE STRING "PM compiler" FORCE)
mark_as_advanced(CMAKE_PM_COMPILER)

#execute_process(COMMAND ${CMAKE_PM_COMPILER} "--version" RESULT_VARIABLE PM_COMPILER_RTN OUTPUT_VARIABLE PM_COMPILER_OUTPUT)

#if( ${PM_COMPILER_RTN} EQUAL "0" )
  #message(WARNING "No version information available")
#else()
  #string(REGEX MATCH ".*(GNAT) ([0-9]+\\.[0-9]+(\\.[0-9]*)*).*" PM_COMPILER_OUTPUT_MATCH ${PM_COMPILER_OUTPUT})
  #set(CMAKE_PM_COMPILER_VERSION ${CMAKE_MATCH_2})
  #set(CMAKE_PM_COMPILER_ID "GNU")
#endif()



if( NOT CMAKE_PM_COMPILER_ID_RUN )
  set(CMAKE_PM_COMPILER_ID_RUN 1)
  include(${CMAKE_ROOT}/Modules/CMakeDetermineCompilerId.cmake)
  #CMAKE_DETERMINE_COMPILER_ID(PM PMFLAGS CMakeCompilerId.adb)
endif()


configure_file(${CMAKE_ROOT}/Modules/CMakePMCompiler.cmake.in
  ${CMAKE_PLATFORM_INFO_DIR}/CMakePMCompiler.cmake
  @ONLY IMMEDIATE)

set(CMAKE_PM_COMPILER_ENV_VAR "PM")
