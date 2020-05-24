@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
start "" /WAIT cmd.exe /c "scoop install coreutils"
start "" /WAIT cmd.exe /c "scoop install wget"
wget https://github.com/rxi/lite/releases/latest
grep -Po "(?<=/rxi/lite/releases/tag/v)(\d+\.)+\d+" ./latest | head -1 > out.txt
set /p latestversion=<out.txt
set /p oldversion=<old.txt
if not "%latestversion%" == "%oldversion%" (
  echo "Needs update"
  start "" /WAIT cmd.exe /c "scoop install tar"
  rm old.txt
  mv out.txt old.txt
  FOR /F "delims=" %%i IN ('ls') DO (
     set warner=false
     set file=%%~xi
     if not ".bat"=="!file!" (
       if not ".sh"=="!file!" (
         if not "old.txt"=="%%i" (
           set warner=true
         )
       )
     )
     if "!warner!"=="true" (
       rm -r ./%%i
     )
  )
  wget https://github.com/rxi/lite/releases/download/v%latestversion%/lite.zip
  tar xvf lite.zip
  rm ./lite.zip
  call getLitePlugs.bat No

)
rm latest out.txt
