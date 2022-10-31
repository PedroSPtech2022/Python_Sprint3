PURPLE='0;35'
NC='\033[0m' 
	
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá sou seu assistente de instalação irei acompanhar os processos e te notificar dos passos a seguir !"
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Vamos atualizar seu sistema antes verificar se temos o Python3 e o PIP instalado."
sudo apt update && sudo apt upgrade -y
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Sistema atualizado com sucesso :)"
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
