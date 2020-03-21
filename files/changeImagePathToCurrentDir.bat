@echo off

rem This batch file moves image file(in subdirectory) to current directory.

set CURRENT="%CD%"

setlocal enabledelayedexpansion
for /f "usebackq delims=" %%n in (`dir /s /b /a ^| findstr /i /r "\.jpg$ \.jpeg$ \.png$"`) do (
set filepath=%%n
call :GET_DIRPATH "!filepath!"
call :GET_FILENAME "!filepath!"

pushd !dirpath!
move !filename! %CURRENT%
echo move !filename! to %CURRENT%
popd
)
endlocal
pause

:GET_DIRPATH
set dirpath="%~dp1"
exit /b

:GET_FILENAME
set filename="%~nx1"
exit /b
