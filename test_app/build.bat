@echo off
pushd %~dp0

:: for find_package
pushd ..\shared\lib\cmake
::set test_static_DIR=%CD%\test_static
::set test_interface_DIR=%CD%\test_interface
::set test_depending_DIR=%CD%\test_depending
set CMAKE_PREFIX_PATH=%CD%
popd

cmake -S . -B build -G "Visual Studio 17 2022"
if errorlevel 1 goto :err

cmake --build build
if errorlevel 1 goto :err

popd
goto :eof

:err
popd
exit /b 1
