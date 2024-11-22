@echo off
pushd %~dp0

:: for find_package
pushd ..\shared\lib\cmake
set test_static_DIR=%CD%\test_static
set test_interface_DIR=%CD%\test_interface
popd

cmake -S . -B build -G "Visual Studio 17 2022"
cmake --build build
pushd ..
set PREFIX=%CD%\shared
popd
cmake --install build --prefix=%PREFIX% --config=Debug
popd
