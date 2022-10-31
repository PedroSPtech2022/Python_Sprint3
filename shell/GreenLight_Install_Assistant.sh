VERSAO=18
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá sou seu assistente de instalação irei acompanhar os processos e te notificar dos passos a seguir !"
sleep 1.5
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Após a compra dos serviços da MoniToll, precisamos instalar algumas aplicações e bibliotecas no seu sistema."
sleep 1.5
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Python3, Python3-PIP, ODBC Driver SQL, Java, Kotlin."
sleep 1.5
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Vamos atualizar seu sistema antes verificar se temos alguma das aplicações instalada."
sudo apt update && sudo apt upgrade -y
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Sistema atualizado com sucesso :)"
sleep 1.5
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Verificando aqui se você possui o ODBC instalado...;"
sleep 2

apt-cache search msodbc
if [ apt-cache search msodbc -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Você já tem o ODBC instalado!!!"
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do ODBC instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o ODBC (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o ODBC ;D"
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório !"
			sleep 2
            curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
            curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list
            sudo apt-get update
            sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
            sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
            echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
            source ~/.bashrc
            sudo apt-get install -y unixodbc-dev
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			if [ $VERSAO -eq 18 ]
				then
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 18 do ODBC. Confirme a instalação quando solicitado ;D"
					sudo apt-get update
					clear
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) ODBC instalado com sucesso!"
				fi
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o ODBC por enquanto, até a próxima então!"
	fi
fi

PURPLE='0;35'
NC='\033[0m' 

echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Atualizando pacotes..."
sudo apt update -y 
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Verificando aqui se você possui o Python3 e o PIP instalado...;"
sleep 2

python3 -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Você já tem o Python3 instalado!!!"
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Python3 instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Python3 e o PIP (S/N)?"
	read inst
	if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Python3 e o PIP ;D"
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório !"
			sleep 2
			sudo apt install python-is-python3
			sudo apt install python3-pip
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Python3 instalado com sucesso!"
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Python3 e o PIP por enquanto, até a próxima então!"
	fi
fi

echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Você autoriza a continuação da instalação de bibliotecas Python (S/N)?"
read inst
if [ \"$inst\" == \"S\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você autorizou e as bibliotecas serão instaladas ;D"
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório !"
			sleep 2
		#	pythonlinux3.py()
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Python3 e o PIP por enquanto, até a próxima então!"
fi		