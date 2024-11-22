@echo off
pushd %~dp0
cmame -S . -B build -G "Visual Studio 17 2022"
cmake --build build
pushd ..
set PREFIX=%CD%\shared
popd
cmake --install build --prefix=%PREFIX% --config=Debug
popd
