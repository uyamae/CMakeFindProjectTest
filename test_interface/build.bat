@echo off
pushd %~dp0

cmake -S . -B build -G "Visual Studio 17 2022"
if errorlevel 1 goto :err

cmake --build build
if errorlevel 1 goto :err

pushd ..
set SHARED=%CD%\shared
popd

cmake --install build --prefix=%SHARED%/test_interface --config=Debug
if errorlevel 1 goto :err

popd
goto :eof

:err
popd
exit /b 1
