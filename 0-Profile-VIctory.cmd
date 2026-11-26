@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"

set "VICTORY_GAME_DIR=C:\Users\UserCruiser\Downloads\GTA6_xbob"
set "VICTORY_GPU_TIMING=1"
set "VICTORY_LOG=info"
set "profile=%~dp0VIctory-gpu-profile.log"

if not exist "%VICTORY_GAME_DIR%\game_scarlett_master.exe" (
  echo Game executable not found:
  echo "%VICTORY_GAME_DIR%\game_scarlett_master.exe"
  pause
  exit /b 2
)

set "runner=%~dp0target\release\victory.exe"
if not exist "%runner%" (
  echo VIctory runner not found:
  echo "%runner%"
  pause
  exit /b 2
)

if not defined VICTORY_AMBIENT_AIR set "VICTORY_AMBIENT_AIR=1.5"
if not defined VICTORY_CACHE_DIR set "VICTORY_CACHE_DIR=%LOCALAPPDATA%\VIctory\cache-pareto"
if not defined VICTORY_TEXTURE_NO_WAIT set "VICTORY_TEXTURE_NO_WAIT=1"
if not defined VICTORY_RELAY set "VICTORY_RELAY=2"
if not defined VICTORY_WIDE_BACK set "VICTORY_WIDE_BACK=1"
if not defined VICTORY_CARD_REHASH_RUNS set "VICTORY_CARD_REHASH_RUNS=1"
if not defined VICTORY_JOIN_COPIES set "VICTORY_JOIN_COPIES=1"
if not defined VICTORY_INDIRECT_WINDOW set "VICTORY_INDIRECT_WINDOW=1"
if not defined VICTORY_RELAY_COPY set "VICTORY_RELAY_COPY=1"
if not defined VICTORY_CARD_STEPS set "VICTORY_CARD_STEPS=2"
if not defined VICTORY_INDIRECT_BATCH set "VICTORY_INDIRECT_BATCH=2"
if not defined VICTORY_MAP_THREADS set "VICTORY_MAP_THREADS=1"
if not defined VICTORY_CARD_AWAKE set "VICTORY_CARD_AWAKE=1"
if not defined VICTORY_SHOW_AFTER set "VICTORY_SHOW_AFTER=1"
if not defined VICTORY_AMBIENT set "VICTORY_AMBIENT=0.8"
if not defined VICTORY_THIN set "VICTORY_THIN=1"
if not defined VICTORY_JOIN_PARTS set "VICTORY_JOIN_PARTS=8"
if not defined VICTORY_UPLOAD_AHEAD set "VICTORY_UPLOAD_AHEAD=1"
if not defined VICTORY_LEVELS_ON_DEMAND set "VICTORY_LEVELS_ON_DEMAND=1"
if not defined VICTORY_CARD_BUFFERS_MIN_KB set "VICTORY_CARD_BUFFERS_MIN_KB=64"

echo Running a GPU timing capture. Reproduce the slow scene, then close the game.
echo Output will be saved to:
echo "%profile%"
echo.

"%runner%" run "%VICTORY_GAME_DIR%\game_scarlett_master.exe" --console series-s --execute > "%profile%" 2>&1
set "exitCode=%errorlevel%"

echo.
echo VIctory exited with code %exitCode%.
echo Timing log: "%profile%"
pause
exit /b %exitCode%
