# Zabbix Templates

Este repositório contém templates auxiliares para uso com o Zabbix 7.4 e usando o agente 2 nos hosts. 

## Template `nvidiasmi_ldd.json`
Template com descoberta por Low Level Discovery do Zabbix. <br>
Este template descobre as placas de video da NVIDIA nos hosts pegando a quantidade de placas por host e os nomes das mesmas. <br> 
Todo o `UserParemeter` da descoberta está no arquivo `nvidia_smi.conf`

## Template `nvidiasmi.json`
É o mesmo template mas sem a descoberta, todo o userparemeter para os itens está no arquivo `nvidia_smi.conf`

## Como usar

1. **Copie e cole o arquivo `nvidia_smi.conf`** para a pasta `C:\Program Files\Zabbix Agent 2\` ou no lugar onde foi instalado o agente zabbix no host e onde há a placa de video da NVIDIA.
2. **Edite o arquivo `zabbix_agentd.conf` como ADM**, adicione a seguinte linha: `Include=C:\Program Files\Zabbix Agent 2\nvidia_smi.conf` no final do arquivo, salve e reinicie o agente do host.
3. Importe o template `nvidiasmi_ldd.json` e/ou `nvidiasmi.json`
4. Faça as devidas modificações de acordo com as suas regras de negócio

## Observações
- O arquivo `ZabbixAgent.bat` fornece um menu interativo para iniciar, parar ou verificar o status do serviço do Zabbix Agent em hosts Windows. 
- Ele é útil em ambientes de laboratório onde não é necessário manter o agente em execução o tempo todo. Idem para o arquivo `ZabbixAgent.sh` nos hosts linux, necessário permissão de execução com `chmod +x ZabbixAgent.sh` e execute com: `./ZabbixAgent.sh`
- O `ZabbixAgent2.bat` é o mesmo só que desativa a regra no firewall (fecha a porta 10050).