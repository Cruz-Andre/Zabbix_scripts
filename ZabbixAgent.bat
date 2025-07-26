@echo off
title Gerenciador do Zabbix Agent (Windows)

:MENU
cls
echo ================================
echo    GERENCIADOR ZABBIX AGENT
echo ================================
echo.
echo 1. Iniciar Zabbix Agent
echo 2. Parar Zabbix Agent
echo 3. Verificar status
echo 4. Sair
echo.
set /p choice=Escolha uma opcao [1-4]: 

if "%choice%"=="1" goto START
if "%choice%"=="2" goto STOP
if "%choice%"=="3" goto STATUS
if "%choice%"=="4" exit
goto MENU

:START
echo.
echo Iniciando o Zabbix Agent...
sc start "Zabbix Agent"
pause
goto MENU

:STOP
echo.
echo Parando o Zabbix Agent...
sc stop "Zabbix Agent"
pause
goto MENU

:STATUS
echo.
echo Status do Zabbix Agent:
sc query "Zabbix Agent"
pause
goto MENU
