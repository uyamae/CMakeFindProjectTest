@echo off
pushd %~dp0

:: for find_package
pushd ..\shared\lib\cmake
::set test_static_DIR=%CD%\test_static
::set test_interface_DIR=%CD%\test_interface
set CMAKE_PREFIX_PATH=%CD%
popd

cmake --version

echo ===============================================================================
echo  cmake
echo ===============================================================================
cmake -S . -B build -G "Visual Studio 17 2022"
if errorlevel 1 goto :err

echo ===============================================================================
echo  build
echo ===============================================================================
cmake --build build
if errorlevel 1 goto :err

pushd ..
set PREFIX=%CD%\shared
popd

echo ===============================================================================
echo  install
echo ===============================================================================
cmake --install build --prefix=%PREFIX% --config=Debug
if errorlevel 1 goto :err

:end
popd
goto :eof

:err
popd
exit /b 1
