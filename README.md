#  <center>Zabbix_Scripts</center>

## Iniciando a utilização do repositório

- 1º -  No servidor destino crie uma pasta nesse seguinte caminho: 'C:\zabbix-agent-scripts\'
- 2º -  Depois de criado, realize o download do pasta Windows e salve dentro do diretório, recentemente criado.

## Validando script no servidor

Abra o programa PowerShell, com privilegios de "Administrador"

```
powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Atualizacoes_Atribuidas_ao_Servidor.ps1"
```
```
powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Contagem_de_Dias_Desde_Ultima_Atualizacao.ps1"
```
```
powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Listar_atualizacoes.ps1"
```

## Alterando a configuração no Zabbix

No arquivo de configuração do Zabbix Agent, procure a opção UserParameters e adicione as informações abaixo:

```
UserParameter=Atualizacao.Servidor,powershell.exe -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Atualizacoes_Atribuidas_ao_Servidor.ps1"
```
```
UserParameter=Contagem.Atualizacao,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Contagem_de_Dias_Desde_Ultima_Atualizacao.ps1"
```
```
UserParameter=Listar.Atualizacao,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Listar_atualizacoes.ps1"
```

 > ## Observação:

Você pode definir as propriedades de tempo limite do padrão de 3 segundos para 1-30 segundos dentro da configuração dos agentes Zabbix e também na configuração do Zabbix Proxy se seu agente for monitorado por proxy.


# Configurando Zabbix Frontend

###### Criar itens em hosts ou templates Zabbix

|       Chave         |        Valor        |
| ------------------- | ------------------- |
|  Nome               |  Dias desde a última atualização do Windows |
|  Tipo               |  Agente Zabbix      |   
|  Chave              |  Atualizacao.Servidor  | 
|  Tipo de informação |  Numeric (unsigned)      |   
| Intervalo de atualização |  1D | 

|       Chave         |        Valor        |
| ------------------- | ------------------- |
|  Nome               |  Contar atualizações desinstaladas do Windows |
|  Tipo               |  Agente Zabbix      |   
|  Chave              |  Contagem.Atualizacao  | 
|  Tipo de informação |  Numeric (unsigned)      |   
| Intervalo de atualização |  1D  | 

|       Chave         |        Valor        |
| ------------------- | ------------------- |
|  Nome               |  Listando os Updates |
|  Tipo               |  Agente Zabbix      |   
|  Chave              |  Listar.atualizacao  | 
|  Tipo de informação |  Log      |   
| Intervalo de atualização |  1D  | 

