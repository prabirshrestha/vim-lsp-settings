@echo off

if "x%1" equ "x" goto :EOF
if "x%2" equ "x" goto :EOF

set server_dir="..\servers\%1"
rd /Q /S "%server_dir%" 2>NUL
md "%server_dir%"
cd "%server_dir%"

python3 -m venv ./venv
venv\bin\pip3 install %2

echo @echo off ^

%%~dp0\venv\bin\%1.cmd %%* ^

> %1.cmd
