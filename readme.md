# Zabbix Scripts

Este repositório contém scripts auxiliares para uso com o Zabbix. 

## Como usar

1. **Copie os scripts** deste repositório para o servidor onde o Zabbix Agent está instalado.
2. **Edite o arquivo `zabbix_agentd.conf`** para adicionar ou modificar as entradas `UserParameter` conforme necessário para cada script.
3. **Crie manualmente os itens e triggers** na interface do Zabbix, utilizando os comandos definidos nos `UserParameter`.

## Observações

- Este repositório já inclui arquivos `.bat` para executar os scripts `.ps1`, 
- Utilize os arquivos `.bat` como intermediários para chamar os scripts PowerShell a partir `UserParameter`.
- Exemplo de configuração no `zabbix_agentd.conf`:
    ```
    UserParameter=gpu.usage,D:\Zabbix_scripts\gpu_usage.bat
    UserParameter=gpu.fanspeed,D:\Zabbix_scripts\gpu_fanspeed.bat
    ```
- Certifique-se de testar cada script manualmente antes de utilizá-lo no Zabbix.
- Este repositório **não** inclui templates, itens ou triggers prontos para importação.
- O arquivo `ZabbixAgent.bat` fornece um menu interativo para iniciar, parar ou verificar o status do serviço do Zabbix Agent. Ele é útil em ambientes de laboratório onde não é necessário manter o agente em execução o tempo todo.