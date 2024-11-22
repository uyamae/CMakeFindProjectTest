@echo off
pushd %~dp0

:: for find_package
pushd ..\shared
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
