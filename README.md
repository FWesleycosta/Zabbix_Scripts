# Zabbix_Scripts
 
Repositório voltado para salvar os scripts que tenho utilizado na ferramenta de monitoramento Zabbix

# Explicação sobre utilização do repositório

- 1º -  No servidor destino crie uma pasta nesse seguinte caminho: 'C:\zabbix-agent-scripts\'
- 2º -  Depois de criado, realize o download do pasta Windows e salve dentro do diretório, recentemente criado.

# Validando script no servidor#

Abra o programa PowerShell, com privilegios de "Administrador"

 - powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Atualizações_Atribuidas_ao_Servidor.ps1"
 
 - powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Contagem_de_Dias_Desde_Última_Atualização.ps1"

~~~

Observação: Para que o script abaixo funcione corretamente, necessário realizar a instalação do módulo "Windows Update" no PowerShell.

######Commando: 

1º - Set-ExecutionPolicy RemoteSigned

2º - Install-Module -Name PSWindowsUpdate

-> https://www.luizhenriquecampos.com.br/2018/09/01/instalando-o-modulo-powershell-do-windows-update/

 - powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Obtendo_Updates.ps1"

 ~~~

# Alterando a configuração no Zabbix

No arquivo de configuração do Zabbix Agent, procure a opção UserParameters e adicione as informações abaixo:

- UserParameter=Atualizacao.Servidor,powershell.exe -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Atualizações_Atribuidas_ao_Servidor.ps1"
- UserParameter=Contagem.Atualizacao,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Contagem_de_Dias_Desde_Última_Atualização.ps1"
- UserParameter=Windows.Update,"c:\zabbix\Update.bat"


Na hora de adicionar o 3º script, primeiro crie uma bat 'Update.bat' e copie a informação abaixo: 

```
@Echo off	
powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Obtendo_Updates.ps1"
```

> Você pode definir as propriedades de tempo limite do padrão de 3 segundos para 1-30 segundos dentro da configuração dos agentes Zabbix e também na configuração do Zabbix Proxy se seu agente for monitorado por proxy.
