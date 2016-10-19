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

include(CMakeTestCompilerCommon)
unset(CMAKE_PM_COMPILER_WORKS CACHE)
set(CMAKE_PM_COMPILER_WORKS TRUE)
#if( NOT CMAKE_PM_COMPILER_WORKS )
  #PrintTestCompilerStatus("PM" "")
  #set(_PM_TEST_FILE "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/TestPMCompiler.pm")

  #file(WRITE ${_PM_TEST_FILE}
    #"type main\n"
    #"  int -> (list string) -> o.\n"
    #"main _ _ :-\n"
    #"  !.\n")
  #message(${_PM_TEST_FILE})
  #try_compile(CMAKE_PM_COMPILER_WORKS ${CMAKE_BINARY_DIR}
    #${_PM_TEST_FILE}
    #OUTPUT_VARIABLE __CMAKE_PM_COMPILER_OUTPUT)

  #set(CMAKE_PM_COMPILER_WORKS ${CMAKE_PM_COMPILER_WORKS})
  #unset(CMAKE_PM_COMPILER_WORKS CACHE)
  #set(PM_TEST_WAS_RUN 1)
#endif()

if( NOT CMAKE_PM_COMPILER_WORKS)
  PrintTestCompilerStatus("PM" " -- broken")

  file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
    "Determining if the PM compiler works failed with "
    "the following output:\n${__CMAKE_PM_COMPILER_OUTPUT}\n\n")

  message(FATAL_ERROR "The PM compiler \"${CMAKE_PM_COMPILER}\" "
    "is not able to compile a simple test program.\nIt fails "
    "with the following output:\n ${__CMAKE_PM_COMPILER_OUTPUT}\n\n"
    "CMake will not be able to correctly generate this project.")
else()
  if( PM_TEST_WAS_RUN )
    PrintTestCompilerStatus("PM" " -- works")

    file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
      "Determining if the PM compiler works passed with "
      "the following output:\n${__CMAKE_PM_COMPILER_OUTPUT}\n\n")
  endif()
endif()

unset(__CMAKE_PM_COMPILER_OUTPUT)


