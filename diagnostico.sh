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

function speed () {
  speedtest=$(speedtest-cli)
  dialog --stdout --title "-= Teste de Velocidade da Interne =-" --msgbox "$speedtest" 0 0

}
function TamDisco() {
  disco=$(df -h | head -n 1 && df -h | grep sd)
  dialog --stdout --title " -= Informações sobre os Discos =- " --msgbox "$disco" 0 0
}
function PingMaquina() {
  ipmaquina=$(dialog --title "-= Ping para IP Destino =-" --stdout --inputbox "Digite o IP Destino:" 0 0)
  resultado=$(ping -c 3 ${ipmaquina})
  dialog --title " Resultado do Ping: " --stdout --msgbox "$resultado" 0 0
}
function NmapScan() {
  faixaip=$(dialog --title "-= Nmap Scanner =-" --stdout --inputbox " Digite a faixa de IP. Ex: 10.0.1.0/24 " 0 0)
  nresultado=$(nmap -sn ${faixaip})
  dialog --title " Resultado do Ping: " --stdout --msgbox "$nresultado" 0 0
}

while true;
    do
  menu=$(dialog --stdout --title "Menu Principal" --menu "Escolha uma opção:" 0 0 0 \
        1 "Testar Velocidade da Internet"       \
        2 "Verificar Espaço do Disco"           \
        3 "Ping uma Estação"                    \
        4 "Scanner Nmap"                        \
        0 "Sair"                                )

        [ $? -ne 0 ] && "Cancelou ou Apertou ESC." && break

          case "$menu" in
                  1) speed;;
                  2) TamDisco;;
                  3) PingMaquina;;
                  4) NmapScan;;
                  0) exit;;
          esac
done
