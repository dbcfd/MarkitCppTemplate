# Markit C++ Template

This is simple template for C++ projects at Markit. The template utilizes CMake (http://www.cmake.org/) to build projects correctly on different machines with different development enviornments. The template includes a basic directory structure to support unit testing, as well as gtest for unit testing. Basic FindX cmake modules are included to demonstrate how find_package works in CMake. The FindDCL module has been further modified to support exports via svn for internal Markit libraries.

## Basic Structure
The template is broken out into two main sections, the application and unit tests. The application is found in the /src directory while tests are found in the /test directory.

### Application Structure
The application is further divided into modules which are unit testable, and the application itself, which is tested at a system level. The application is found in the /application directory while the modules are found in the /modules directory.

Each module will be built as a shared library, which allows only one copy of the library to be loaded at a time, when multiple projects use the same module. Each module includes the necessary export functions to achieve this behavior.

### Tests Structure
Tests are divided into /resources (e.g. xml files to test against) and /src which contains the unit tests themselves.

## FindXXX CMake Modules
Usage of third party libraries requires a FindXXX Cmake Module. Examples are provided in /cmakeModules, one of which is FindDCL.cmake which attempts to locate the DCL library, performing an svn export to /thirdparty if DCL is not found. See FindDCL.cmake for more information on which variables it uses, and which variables it creates. FindDCL.cmake is currently called by ModuleA.

