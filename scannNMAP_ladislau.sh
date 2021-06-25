#!/bin/bash
# AUTOR: Ladislau M.
# DATA: 22/06/2021
# ----------------------Requisitos------------------------
# instalar nmap ===> sudo apt-get install nmap
# instalar figlet ===> sudo apt-get install figlet
# 1- Executando no terminal: sudo chmod +x scannNMAP_ladislau.sh 
# 2- Executando no terminal: sudo ./scannNMAP_ladislau.sh
clear

figlet -c -t $'Nmap Scanner\nLADISLAU M.\nversion 1.0'
Menu() {
	echo "     NMAP Scann Ladislau version 1.0"
	echo ""		
	echo "    <==================================================================================>"
	echo  -e        "            \e[92mPor favor, indique o tipo de verificação que deseja executar "
	echo  -e "    \e[97m<<=================================================================================>"
	echo  -e "    \e[97m01 - Scanner  as 10 portas mais conhecidas para encontrar serviços em cada porta."
	echo  -e "    \e[97m02 - Scanner  as 20 portas mais conhecidas para encontrar serviços em cada porta."
	echo  -e "    \e[97m03 - Scanner  as 1000 portas mais conhecidas para encontrar serviços em cada porta."

	echo  ""
	echo  "    <====================================================================================>"
	echo  -e "     \e[92mVulnerabilidades <=== Nesta \e[31mversão\e[0m \e[92mos scanners são das 10 portas mais conhecidas ===>\e[0m     "
	echo  -e "    \e[97m<====================================================================================>"	

	echo ""
      	echo -e "    \e[97m04 |<=> \e[1m\e[31mnmap NSE scan:\e[0m \e[92mauth\e[0m \e[33m=>\e[0m Esta categoria de script inclui todos os tipos de scripts relacionados à autenticação e escalonamento de privilégios."
    	echo -e "    \e[97m05 |<=> \e[1m\e[31mnmap NSE scan:\e[0m \e[92mbrute\e[0m \e[33m=>\e[0m Esta é uma categoria de scripts projetados para fazer força bruta."
    	echo -e "    \e[97m06 |<=> \e[1m\e[31mnmap NSE scan:\e[0m \e[92mdefault\e[0m \e[33m=>\e[0m Esses scripts são o conjunto padrão e são executados ao usar as opções -sC ou -A em vez de listar os scripts com --script."
    	echo -e "    \e[97m07 |<=> \e[1m\e[31mnmap NSE scan:\e[0m \e[92mdos\e[0m \e[33m=>\e[0m Este é o grupo de scripts que permite que você execute ataques Dos e / ou DDoS"
    	echo -e "    \e[97m08 |<=> \e[1m\e[31mnmap NSE scan:\e[0m \e[92mexploit\e[0m \e[33m=>\e[0m Esta categoria de script é usada para operar serviços baseados em CVEs."
    	echo -e "    \e[97m09 |<=> \e[1m\e[31mnmap NSE scan:\e[0m \e[92mvuln\e[0m \e[33m=>\e[0m Esta é a categoria de scripts relacionada à detecção e exploração de vulnerabilidades."
    	echo -e "    \e[97m10 |<=> \e[1m\e[31mMinha escolha:\e[0m \e[92m'a_minha_escolha'\e[0m \e[33m=>\e[0m Mais opeções em \e[1m\e[31mhttps://nmap.org/book/nse-usage.html\e[0m"
    	echo -e "    \e[97m0  |<=> \e[33mSAIR\e[0m"    	
    	echo "   OPEÇÃO: "
    	read opcao
    	case $opcao in
    	01) Opcao1 ;;
    	02) Opcao2 ;;
    	03) Opcao3 ;;
    	04) Opcao4 ;;
    	05) Opcao5 ;;
    	06) Opcao6 ;;
    	07) Opcao7 ;;
    	08) Opcao8 ;;
    	9)  Opcao9  ;;
    	10) Opcao10 ;;
       	0) Sair ;;
       	*) echo "Comando desconhecido"; limpar; Menu;;

    	esac
}


Opcao1 () {

    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."
    read host

    nmap -v -sV -sS  $host --top-ports 10 -oN scann10.nmap -F -d 2> /dev/null 
    clear				
    grep -E 'open|SERVICE|STATE' scann10.nmap | grep -v "Discovere" 2> /dev/null
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
        
    read opcao
    case $opcao in

    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao1 ;;
    esac
}

Opcao2 () {
   

    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."
    read host    
    nmap -v -sV -sS  $host --top-ports 20 -oN scann20.nmap -F -d 2> /dev/null 
    clear				
    grep -E 'open|SERVICE|STATE' scann20.nmap | grep -v "Discovere" 2> /dev/null
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao
    case $opcao in
    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao2  ;;
    esac
}

Opcao3 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."
    read host    
    nmap -v -sV -sS  $host --top-ports 10 -oN scann1000.nmap -F -d 2> /dev/null 
    clear				
    grep -E 'open|SERVICE|STATE' scann1000.nmap | grep -v "Discovere" 2> /dev/null
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao
    case $opcao in
    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao3  ;;
    esac
}

Opcao4 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."  
    read host
    nmap -v -sV -sS  $host --top-ports 10  --script auth -oN scann1vuln.nmap -F -d 2> /dev/null 
    				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao4  ;;
    esac
}

Opcao5 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."
    read host
    nmap -v -sV -sS  $host --top-ports 10  --script brut -oN scann1vuln.nmap -F -d 2> /dev/null 
    				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao5  ;;
    esac
}

Opcao6 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt." 
    read host
    nmap -v -sV -sS  $host --top-ports 10  --script default -oN scann1vuln.nmap -F -d 2> /dev/null 
    				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao6  ;;
    esac
}

Opcao7 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."  
    read host
    nmap -v -sV -sS  $host --top-ports 10  --script dos -oN scann1vuln.nmap -F -d 2> /dev/null 
    				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) echo "Comando desconhecido" ; echo ; Opcao7  ;;
    esac
}

Opcao8 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt." 
    read host
    nmap -v -sV -sS  $host --top-ports 10  --script exploit -oN scann1vuln.nmap -F -d 2> /dev/null 
    				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) "Comando desconhecido" ; echo ; Opcao8  ;;
    esac
}

Opcao9 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt."   
    read host
    nmap -v -sV -sS  $host --top-ports 10  --script vuln -oN scann1vuln.nmap -F -d 2> /dev/null 
    				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) echo  "Comando desconhecido" ; echo ; Opcao9  ;;
    esac
}
Opcao10 () {
    echo -e "Degite o site da vítima: \e[92m (sem https:// ou sem http://)\e[0m Exemplo: www.exemplo.pt ou exemplo.pt." 
    read host
    echo -e "\e[92mAdciona o tipo de script :\e[0m" 
    read scriptV

    nmap -v -sV -sS  $host --top-ports 10  --script $scriptV --top-ports 3 -oN scann1vuln.nmap -F -d 2> /dev/null 
    clear
    grep -E '' scann1vuln.nmap 				
    
    echo "================================="
    echo -e "\e[92m MENU  "
    echo -e "\e[97m================================="    
    echo -e '\n'    
    echo " 1  Voltar"
    echo " 0  Sair"
    
    read opcao2
    case $opcao2 in
    1) Voltar ;;
    0) Sair ;;
    *) echo  "Comando desconhecido" ; echo ; Opcao10  ;;
    esac
}
Voltar() {
    clear
        Menu
}
limpar() {
    clear
        
}

Sair() {
    clear
    exit
}

Menu		
					