# [CMake Prolog Mali](https://github.com/kwon-young/cmake-pm)

Prolog Mali language support for CMake.
https://gforge.inria.fr/projects/prolog-mali/

## Installation

```
cmake -P install.cmake
```

**Alternative:**

Copy the content of `Modules` directory into `Modules` of the CMake installation.


## Usage

The Prolog Mali language is enabled by either `project(<NAME> PM)` or `enable_language(PM)` within the `CMakeLists.txt`.

CMake is used as usual:

```
# Out of source build
$ mkdir build
$ cd build

$ cmake ..
$ make
```

## Example

```cmake
cmake_minium_required(VERSION 2.6)

project(PmTest)


# Enable Prolog Mali support
enable_language(PM)

# Build an executable with a source file and a package
add_executable(${PROJECT_NAME} src/m1.pm src/m2.pm)

```

This will build an application `PmTest`.


## Limitations

Since this module is in a very early development state, there are some limitations at the moment:

 - only pmc compiler is supported
 - tested only on linux


## License

**GNU General Public License (GPL)**

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
