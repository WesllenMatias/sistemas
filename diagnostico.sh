#!/usr/bin/env bash
#
#
#diagnostico.sh - Script para auxiliar em diagnosticos
#
# Site:       https://wesllenmatias.com.br
# Autor:      Wesllen Matias
# Manutenção: Wesllen Matias
#
#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v3.2 - Versão inicial
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
#while read line
#do
#    echo $line
#done < /dir/arq.log | pv -n | dialog --gauge "Lendo log..." 10 70 0
# ------------------------------TESTES------------------------------------------ #
[ ! -x $(which sshpass) ] && sudo apt install sshpass -y > /dev/null
[ ! -x $(which nmap) ] && sudo apt install nmap -y > /dev/null
[ ! -x $(which dialog) ] && sudo apt install dialog -y > /dev/null
[ ! -x $(which speedtest-cli) ] && sudo apt install speedtest-cli -y > /dev/null


#-------------------------- FUNCOES ----------------------------------------- #

function speed () {
  speedtest-cli >> out |
  dialog \
  --stdout \
  --title "-= Teste de Velocidade da Internet =-" \
  --tailbox out 0 0
#counter=0
#(
# set infinite while loop
#while :
#do
#speedtest=$(speedtest-cli > speed.txt)
#cat <<EOF
#XXX
#$counter
#$speedtest ( $counter%):
#XXX
#OF
# increase counter by 10
#(( counter+=10 ))
#[ $counter -eq 100 ] && break
# delay it a specified amount of time i.e 1 sec
#sleep 1
#done
#) |
#dialog --title "Testando Velocidade" --gauge "Aguarde..." 7 70 0 && \
#dialog \
#  --stdout \
#  --title "-= Teste de Velocidade da Interne =-" \
#  --msgbox "$(cat speed.txt)" 0 0
}
function TamDisco() {
  disco=$(df -h | head -n 1 && df -h | grep sd)
  dialog --stdout --title " -= Informações sobre os Discos =- " \
  --msgbox "$disco" 0 0
}
function PingMaquina() {
  ipmaquina=$(dialog \
  --title "-= Ping para IP Destino =-" \
  --stdout \
  --inputbox "Digite o IP Destino:" 0 0)
  resultado=$(ping -c 3 ${ipmaquina})
  dialog \
  --title " Resultado do Ping: " \
  --stdout \
  --msgbox "$resultado" 0 0
}
function NmapScan() {
  faixaip=$(dialog \
  --title "-= Nmap Scanner =-" \
  --stdout \
  --inputbox " Digite a faixa de IP. Ex: 10.0.1.0/24 " 0 0)
  nresultado=$(nmap -sn ${faixaip})
  dialog \
  --title " Resultado do Ping: " \
  --msgbox "$nresultado" 0 0
}
function CMDremoto() {
form=$(dialog \
--stdout \
--form "Informe os dados de Conexao" \
0 0 0 \
"IP do Host:" 1 1 "" 1 20 20 20 \
"Usuario do Host:" 2 1 "" 2 20 20 20 \
"Senha:" 3 1 "" 3 20 20 20 \
"Comando:" 4 1 "" 4 20 20 20
)
maquina=$($form | cut -d ' ' -f 1)
usuario=$($form | cut -d ' ' -f 2)
pwd=$($form | cut -d ' ' -f 3)
comando=($form | cut -d ' ' -f 4)
#  maquina=$(dialog \
#  --title "-=HOST=-" \
#  --stdout \
#  --inputbox "Informe o IP do Host:" 0 0)
#  usuario=$(dialog \
#  --title "-=Usuário=-" \
#  --stdout \
#  --inputbox "Informe o Usuário:" 0 0)
#  pwd=$(dialog \
#  --title "-=Confirmação=-" \
#  --stdout \
#  --passwordbox "Digite a Senha do SSH:" 0 0)
#  comando=$(dialog \
#  --title "-=Comando=-" \
#  --inputbox "Entre com o Comando:" 0 0)
conexao=/usr/bin/ssh
cmdext=$(sshpass -p $pwd $conexao $usuario@$maquina "$comando")
dialog \
--title "Retorno do Comando" \
--stdout \
--msgbox "$cmdext" 0 0 \
}
function atualizar() {
  origem=$(dialog \
  --title "Arquivo a ser Copiado:" \
  --stdout \
  --fselect / 0 0)
  destino=$(dialog \
  --title "Destino da Cópia:" \
  --stdout \
  --fselect / 0 0)
  copia=$(cp $origem $destino)
  dialog \
  --title " Para onde vai ser Copiado " \
  --stdout \
  --msgbox "$(echo $copia)" 0 0
}
function temperatura() {
  rasp1=192.168.11.90
  pwd=valessh
  temp='vcgencmd measure_temp'
  volt='vcgencmd measure_volts'
  usuario=pi
  ssh=/usr/bin/ssh
  cmdrasp=$(sshpass -p $pwd $ssh $usuario@$rasp1 $temp)
  dialog \
  --title "-=Temperatura das Rapsberrys=-" \
  --stdout \
  --msgbox "$(echo "Temperaturas:
  $cmdrasp")" 0 0
}

#-------------------------- MENU ------------------------------------------------------ #
while true;
    do
  menu=$(dialog --stdout --title "Menu Principal" --backtitle "Sistema de Diagnosticos" --menu "Escolha uma opção:" 0 0 0 \
        1 "Testar Velocidade da Internet"       \
        2 "Verificar Espaço do Disco"           \
        3 "Ping uma Estação"                    \
        4 "Scanner Nmap"                        \
        5 "Comando Remoto"                      \
        6 "Atualizar"                           \
        7 "Temperatura das Raspberrys"          \
        0 "Sair"                                )

        [ $? -ne 0 ] && "Cancelou ou Apertou ESC." && break

          case "$menu" in
                  1) speed;;
                  2) TamDisco;;
                  3) PingMaquina;;
                  4) NmapScan;;
                  5) CMDremoto;;
                  6) atualizar;;
                  7) temperatura;;
                  0) exit;;
          esac
done
