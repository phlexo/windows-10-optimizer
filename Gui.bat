@ECHO OFF
echo Starting %~dpn0.ps1
powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1' %*"
