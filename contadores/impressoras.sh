##!/usr/bin/env bash
# impressora.sh - Ferramenta para controle de inventário
#
# impressora.sh - Captura de Contadores das Impressoras via SNMP.
#
# Site:       https://wesllen.com.br
# Autor:      Wesllen Matias
# Manutenção: Wesllen Matias
#
# ------------------------------------------------------------------------ #
# Uma ferramenta para controle de inventário.
# Programa para cadastar e administrar inventário#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v0.1 - Versão inicial
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
#----------__VARIAEIS_-------------
snmp=/usr/bin/snmpwalk
snmpversion="-v2c"
parametro="-c"
opt=public
printadm=192.168.11.133
printti=192.168.11.134
printl1recep=192.168.11.141
printl1conf=192.168.11.139
printl1cred=192.168.11.146
printl1depo=192.168.11.147
printdir1=192.168.11.131
printtesou=192.168.11.149
printvendext=192.168.11.143
printl2conf=192.168.12.18
printl2recep=192.168.12.19
printl3recep=192.168.13.130
printl6conf=192.168.16.30
printl6depo=192.168.16.28
printl7conf=192.168.17.148
hname=1.3.6.1.2.1.1.5
serial=1.3.6.1.2.1.43.5.1.1.17
contador=1.3.6.1.2.1.43.10.2.1.4

#-----------_FUNÇÕES_---------------

function printname() {

resultado="$( \

        echo "===========LOJA 01" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printti $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printti $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printti $contador | awk '{ print $4 }')" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printadm $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printadm $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printadm $contador | awk '{ print $4 }')" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl1recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl1recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl1recep $contador | awk '{ print $4 }')" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl1cred $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl1cred $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl1cred $contador | awk '{ print $4 }')" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl1depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl1depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl1depo $contador | awk '{ print $4 }')" && \
        echo "===========LOJA 02" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl2conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl2conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl2conf $contador | awk '{ print $4 }')" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl2recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl2recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl2recep $contador | awk '{ print $4 }')" && \
        echo "===========LOJA 03" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl3recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl3recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl3recep $contador | awk '{ print $4 }')" && \
        echo "===========LOJA 06" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl6conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl6conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl6conf $contador | awk '{ print $4 }')" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl6depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl6depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl6depo $contador | awk '{ print $4 }')" && \
        echo "===========LOJA 07" && \
        echo "Impressora: $($snmp $snmpversion $parametro $opt $printl7conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Serial: $($snmp $snmpversion $parametro $opt $printl7conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo "Contador: $($snmp $snmpversion $parametro $opt $printl7conf $contador | awk '{ print $4 }')"
)"

dialog --title "Captura de Contadores" \
       --msgbox "$(echo $resultado)" 100 30
}
function contadorestelegram() {
  CURL="/usr/bin/curl"
  BOT_TOKEN='625744069:AAGTXbrysLdWXsapmqhI9SPYpgledYJWPa4'
  USER="-251553925"
  COOKIE="/tmp/telegram_cookie-$(date "+%Y.%m.%d-%H.%M.%S")"
  SUBJECT="$( \
          echo "===========LOJA 01==========" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printti $hname | awk '{ print $4 }' | tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printti $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printti $contador | awk '{ print $4 }')" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printadm $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printadm $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printadm $contador | awk '{ print $4 }')" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl1recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl1recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl1recep $contador | awk '{ print $4 }')" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl1cred $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl1cred $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl1cred $contador | awk '{ print $4 }')" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl1depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl1depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl1depo $contador | awk '{ print $4 }')" && \
          echo "=======LOJA 02======" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl2conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl2conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl2conf $contador | awk '{ print $4 }')" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl2recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl2recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl2recep $contador | awk '{ print $4 }')" && \
          echo "=======LOJA 03======" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl3recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl3recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl3recep $contador | awk '{ print $4 }')" && \
          echo "=======LOJA 06======" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl6conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl6conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl6conf $contador | awk '{ print $4 }')" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl6depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl6depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl6depo $contador | awk '{ print $4 }')" && \
          echo "=======LOJA 07======" && \
          echo "Impressora: $($snmp $snmpversion $parametro $opt $printl7conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Serial: $($snmp $snmpversion $parametro $opt $printl7conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo "Contador: $($snmp $snmpversion $parametro $opt $printl7conf $contador | awk '{ print $4 }')"
  )"
${CURL} -k -c ${COOKIE} -b ${COOKIE} -X \
GET "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${USER}&text=${SUBJECT}"

}


#-------------------MENU---------------------------

while true;
    do
  menu=$(dialog --stdout --title "Menu Principal" --menu "Escolha uma opção:" 0 0 0 \
        1 "Capturar Contadores Mostrar em Tela"       \
        2 "Capturar Contadores Enviar Telegram"       \
        0 "Sair"                                )

        #[ $? -ne 0 ] && "Cancelou ou Apertou ESC." && break

          case "$menu" in
                  1) printname;;
                  2) contadorestelegram;;
                  0) exit;;
          esac
    done
