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

cmake_minimum_required(VERSION 2.6)

file(GLOB MODULES "Modules/*.cmake" "Modules/*.in")
file(GLOB MODULES_COMPILER "Modules/Compiler/*.cmake")

file(INSTALL ${MODULES} DESTINATION "${CMAKE_ROOT}/Modules")
file(INSTALL ${MODULES_COMPILER} DESTINATION "${CMAKE_ROOT}/Modules/Compiler")
