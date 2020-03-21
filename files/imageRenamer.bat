@echo off

rem This batch file rename photo (like: jpg, jpeg, png) to number.

setlocal enabledelayedexpansion
set num=1
for /f "usebackq delims=" %%n in (`dir /a /b ^| findstr /i /r "\.jpg$ \.jpeg$ \.png$"`) do (
set numtmp=00!num!
set numtmp=!numtmp:~-3,3!
echo %%n to !numtmp!
ren %%n !numtmp!.jpeg
set /a num+=1
)
endlocal
pause
exit /b
