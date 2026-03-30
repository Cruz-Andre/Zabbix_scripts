@echo off
:: Solicita privilégios de administrador se não houver
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :MENU
) else (
    echo.
    echo ##########################################################
    echo # ERRO: EXECUTE ESTE SCRIPT COMO ADMINISTRADOR!          #
    echo ##########################################################
    pause
    exit
)

:MENU
cls
title Gerenciador Zabbix (Agente + Firewall)
echo ===============================================
echo      GERENCIADOR ZABBIX (Windows 11)
echo ===============================================
echo.
echo [1] ATIVAR TUDO (Servico + Firewall)
echo [2] DESATIVAR TUDO (Servico + Firewall)
echo [3] VERIFICAR STATUS (Porta e Servico)
echo [4] SAIR
echo.
set /p choice=Escolha uma opcao [1-4]: 

if "%choice%"=="1" goto START
if "%choice%"=="2" goto STOP
if "%choice%"=="3" goto STATUS
if "%choice%"=="4" exit
goto MENU

:START
echo.
echo [!] Iniciando o Zabbix Agent...
sc start "Zabbix Agent 2"
echo [!] Abrindo porta 10050 no Firewall...
powershell -Command "Enable-NetFirewallRule -DisplayName '*Zabbix*'"
echo.
echo Concluido com sucesso!
pause
goto MENU

:STOP
echo.
echo [!] Parando o Zabbix Agent...
sc stop "Zabbix Agent 2"
echo [!] Fechando porta 10050 no Firewall...
powershell -Command "Disable-NetFirewallRule -DisplayName '*Zabbix*'"
echo.
echo Zabbix desativado e porta trancada.
pause
goto MENU

:STATUS
echo.
echo --- STATUS DO SERVICO ---
sc query "Zabbix Agent 2" | findstr "STATE"
echo.
echo --- STATUS DO FIREWALL (Porta 10050) ---
powershell -Command "Get-NetFirewallRule -DisplayName '*Zabbix*' | Select-Object DisplayName, Enabled"
echo.
echo --- TESTE DE ESCUTA LOCAL ---
netstat -an | findstr "10050"
pause
goto MENU