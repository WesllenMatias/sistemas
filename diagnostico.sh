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
[ ! -x $(which sshpass) ] && apt install sshpass -y > /dev/null
[ ! -x $(which nmap) ] && apt install nmap -y > /dev/null

#-------------------------- FUNCOES ----------------------------------------- #

function speed () {
  speedtest=$(speedtest-cli)
  dialog \
  --stdout \
  --title "-= Teste de Velocidade da Interne =-" \
  --msgbox "$speedtest" 0 0
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
  maquina=$(dialog \
  --title "-=HOST=-" \
  --stdout \
  --inputbox "Informe o IP do Host:" 0 0)
  usuario=$(dialog \
  --title "-=Usuário=-" \
  --stdout \
  --inputbox "Informe o Usuário:" 0 0)
  pwd=$(dialog \
  --title "-=Confirmação=-" \
  --stdout \
  --passwordbox "Digite a Senha do SSH:" 0 0)
  comando=$(dialog \
  --title "-=Comando=-" \
  --stdout \
  --inputbox "Entre com o Comando:" 0 0)
  conexao=/usr/bin/ssh
  cmdext=$(sshpass -p $pwd $conexao $usuario@$maquina "$comando")
      dialog \
      --title "Retorno do Comando" \
      --stdout \
      --msgbox "$cmdext" 0 0

}

#-------------------------- MENU ------------------------------------------------------ #
while true;
    do
  menu=$(dialog --stdout --title "Menu Principal" --menu "Escolha uma opção:" 0 0 0 \
        1 "Testar Velocidade da Internet"       \
        2 "Verificar Espaço do Disco"           \
        3 "Ping uma Estação"                    \
        4 "Scanner Nmap"                        \
        5 "Comando Remoto"                      \
        0 "Sair"                                )

        [ $? -ne 0 ] && "Cancelou ou Apertou ESC." && break

          case "$menu" in
                  1) speed;;
                  2) TamDisco;;
                  3) PingMaquina;;
                  4) NmapScan;;
                  5) CMDremoto;;
                  0) exit;;
          esac
done
