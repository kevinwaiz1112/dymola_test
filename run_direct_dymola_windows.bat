@echo off
setlocal

set SCRIPT_DIR=%~dp0
set DYMOLA_EXE=C:\Program Files\Dymola 2024x\bin64\Dymola.exe

if not exist "%DYMOLA_EXE%" (
  echo Dymola nicht gefunden:
  echo %DYMOLA_EXE%
  exit /b 1
)

cd /d "%SCRIPT_DIR%"

if not exist results mkdir results

"%DYMOLA_EXE%" /nowindow "%SCRIPT_DIR%simulate_example.mos"

endlocal