# Zabbix_Scripts
 
Repositório voltado para salvar os scripts que tenho utilizado na ferramenta de monitoramento Zabbix

# Explicação sobre utilização do repositório

- 1º -  No servidor destino crie uma pasta nesse seguinte caminho: 'C:\zabbix-agent-scripts\'
- 2º -  Depois de criado, realize o download do pasta Windows e salve dentro do diretório, recentemente criado.

# Validando script no servidor, antes de adicionar a função ao Zabbix #

Abra o programa PowerShell, com privilegios de "Administrador"

 - powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Atualizações_Atribuidas_ao_Servidor.ps1"
 
 - powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Contagem_de_Dias_Desde_Última_Atualização.ps1"

~~~

Observação: Para que funcione o script corretamente, necessário rodar o comando abaixo para realizar a instalação do módulo "Windows Update".

{ Install-Module -Name PSWindowsUpdate -Force }

 - powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\Windows_Server\Obtendo_Updates.ps1"

 ° Link referência: https://adamtheautomator.com/pswindowsupdate/

 ~~~
