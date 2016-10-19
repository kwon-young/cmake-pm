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

if(UNIX)
    set(CMAKE_PM_OUTPUT_EXTENSION .o)
else()
    set(CMAKE_PM_OUTPUT_EXTENSION .o)
endif()

set(CMAKE_PM_SOURCE_FILE_EXTENSIONS pm)


if(CMAKE_PM_COMPILER_ID)
    include(Compiler/${CMAKE_PM_COMPILER_ID}-PM OPTIONAL)
endif()


set(CMAKE_PM_FLAGS ${CMAKE_PM_FLAGS_INIT} CACHE STRING "Flags used by the compiler during all build types.")

if( NOT CMAKE_NOT_USING_CONFIG_FLAGS )
    if( NOT CMAKE_NO_BUILD_TYPE )
        set(CMAKE_PM_BUILD_TYPE ${CMAKE_BUILD_TYPE_INIT} CACHE STRING "Choose the type of build, options are: None (CMAKE_PM_FLAGS used) Debug Release.")
    endif()

    set(CMAKE_PM_FLAGS_DEBUG "${CMAKE_PM_FLAGS_DEBUG_INIT}" CACHE STRING "Flags used by the compiler during debug builds.")
    set(CMAKE_PM_FLAGS_RELEASE "${CMAKE_PM_FLAGS_RELEASE_INIT}" CACHE STRING "Flags used by the compiler during release builds.")
endif()

if(CMAKE_PM_STANDARD_LIBRARIES_INIT)
    set(CMAKE_PM_STANDARD_LIBRARIES "${CMAKE_PM_STANDARD_LIBRARIES_INIT}" CACHE STRING "Libraries linked by defalut with all PM applications.")
    mark_as_advanced(CMAKE_PM_STANDARD_LIBRARIES)
endif()

include(CMakeCommonLanguageInclude)

set(CMAKE_PM_COMPILE_OBJECT "<CMAKE_PM_COMPILER> <FLAGS> <INCLUDES> -c <SOURCE>")
set(CMAKE_PM_LINK_EXECUTABLE "<CMAKE_PM_COMPILER> <FLAGS> <INCLUDES> <CMAKE_PM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

mark_as_advanced(
  CMAKE_PM_FLAGS
  CMAKE_PM_FLAGS_DEBUG
  CMAKE_PM_FLAGS_RELEASE
  )

set(CMAKE_PM_INFORMATION_LOADED 1)
