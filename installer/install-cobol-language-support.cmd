@echo off

setlocal

cd %~dp0

set server_dir=..\servers\cobol-language-support
if exist %server_dir% rd /Q /S "%server_dir%"
md "%server_dir%"
cd "%server_dir%"

set version=0.9.1
set url=https://github.com/eclipse/che-che4z-lsp-for-cobol/releases/download/%version%/cobol-language-support-%version%.vsix
curl -LO "%url%"
unzip "cobol-language-support-%version%.vsix"

echo @echo off ^

java "-Dline.speparator=\r\n" -jar "%%~dp0\extension\server\lsp-service-cobol-%version%.jar" pipeEnabled ^

> cobol-language-support.cmd

