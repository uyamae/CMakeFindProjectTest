@echo off
cd /d %~dp0

if exist shared rmdir /S /Q shared

call test_static/build.bat
if errorlevel 1 goto :end

call test_interface/build.bat
if errorlevel 1 goto :end

call test_depending/build.bat
if errorlevel 1 goto :end

call test_app/build.bat
if errorlevel 1 goto :end

:end
