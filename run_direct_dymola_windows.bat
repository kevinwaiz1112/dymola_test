@echo off
setlocal

set SCRIPT_DIR=%~dp0
set DYMOLA_EXE=C:\Program Files\Dymola 2026x\bin64\Dymola.exe

echo [1] Starte Direct Runner...
echo [2] Script dir: %SCRIPT_DIR%
echo [3] Dymola: %DYMOLA_EXE%

if not exist "%DYMOLA_EXE%" (
  echo Dymola nicht gefunden:
  echo %DYMOLA_EXE%
  exit /b 1
)

cd /d "%SCRIPT_DIR%"
if not exist results mkdir results

echo [4] Starte Dymola mit MOS...
"%DYMOLA_EXE%" "%SCRIPT_DIR%simulate_example.mos"
echo [5] Dymola beendet mit Exit-Code %ERRORLEVEL%

endlocal