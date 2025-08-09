#!/bin/bash
# filepath: d:/Zabbix_scripts/ZabbixAgent.sh

while true; do
    clear
    echo "==============================="
    echo "   GERENCIADOR ZABBIX AGENT"
    echo "==============================="
    echo
    echo "1. Iniciar Zabbix Agent"
    echo "2. Parar Zabbix Agent"
    echo "3. Verificar status"
    echo "4. Sair"
    echo
    read -p "Escolha uma opcao [1-4]: " choice

    case $choice in
        1)
            echo
            echo "Iniciando o Zabbix Agent..."
            sudo systemctl start zabbix-agent2
            read -p "Pressione Enter para continuar..."
            ;;
        2)
            echo
            echo "Parando o Zabbix Agent..."
            sudo systemctl stop zabbix-agent2
            read -p "Pressione Enter para continuar..."
            ;;
        3)
            echo
            echo "Status do Zabbix Agent:"
            sudo systemctl status zabbix-agent2
            read -p "Pressione Enter para continuar..."
            ;;
        4)
            exit
            ;;
        *)
            echo "Opcao invalida!"
            read -p "Pressione Enter para continuar..."
            ;;
    esac
done