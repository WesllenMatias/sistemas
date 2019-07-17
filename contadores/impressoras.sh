##!/usr/bin/env bash
# impressora.sh - Ferramenta para controle de inventário
#
# impressora.sh - Captura de Contadores das Impressoras via SNMP.
#
# Site:       https://wesllen.com.br
# Autor:      Wesllen Matias
# Manutenção.: Wesllen Matias
#
# ------------------------------------------------------------------------ #
# Uma ferramenta para controle de inventário.
# Programa para cadastar e administrar inventário#
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 - Versão inicial
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
printl1rh=192.168.11.138
printl2conf=192.168.12.18
printl2recep=192.168.12.19
printl2depo=192.168.12.40
printl3recep=192.168.13.130
printl3conf=192.168.13.136
printl3depo=192.168.13.137
printl6conf=192.168.16.30
printl6depo=192.168.16.28
printl7conf=192.168.17.148
printmjcx=192.168.11.137
printmjvd=192.168.11.145
printvdfcx=192.168.11.150
printvdfvd=192.168.11.144
printkm6recep=192.168.11.142
printkm6rotas=192.168.11.151
hname=1.3.6.1.2.1.1.5
serial=1.3.6.1.2.1.43.5.1.1.17
contador=1.3.6.1.2.1.43.10.2.1.4

#-----------_FUNÇÕES_---------------

function printname() {

l1printti="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printti $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printti $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printti $contador | awk '{ print $4 }')" \
        )"
l1printadm="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printadm $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printadm $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printadm $contador | awk '{ print $4 }')" \
        )"
l1printrecep="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1recep $contador | awk '{ print $4 }')" \
        )"
l1printcred="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1cred $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1cred $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1cred $contador | awk '{ print $4 }')" \
        )"
l1printdepo="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1depo $contador | awk '{ print $4 }')" \
        )"
l2printconf="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl2conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl2conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl2conf $contador | awk '{ print $4 }')" \
        )"
l2printrecep="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl2recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl2recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl2recep $contador | awk '{ print $4 }')" \
        )"
l2printdepo="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl2depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl2depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl2depo $contador | awk '{ print $4 }')" \
        )"
l3printrecep="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl3recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl3recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl3recep $contador | awk '{ print $4 }')\n" \
        )"
l3printconf="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl3conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl3conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl3conf $contador | awk '{ print $4 }')\n" \
        )"
l3printdepo="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl3depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl3depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl3depo $contador | awk '{ print $4 }')\n" \
        )"
l6printconf="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl6conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl6conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl6conf $contador | awk '{ print $4 }')\n" \
        )"
l6printdepo="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl6depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl6depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl6depo $contador | awk '{ print $4 }')" \
        )"
l7printconf="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl7conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl7conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl7conf $contador | awk '{ print $4 }')" \
        )"
mjprintcx="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printmjcx $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printmjcx $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printmjcx $contador | awk '{ print $4 }')" \
        )"
mjprintvd="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printmjvd $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printmjvd $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printmjvd $contador | awk '{ print $4 }')" \
        )"
vdfprintcx="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printvdfcx $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printvdfcx $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printvdfcx $contador | awk '{ print $4 }')" \
        )"
vdfprintvd="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printvdfvd $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printvdfvd $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printvdfvd $contador | awk '{ print $4 }')" \
        )"
rhprintl1="$( \
        echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1rh $hname | awk '{ print $4 }' | tr " \" " " ")" && \
        echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1rh $serial | awk '{ print $4 }'| tr " \" " " ")" && \
        echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1rh $contador | awk '{ print $4 }')" \
        )"
dialog --title "Captura de Contadores" \
       --msgbox "$(echo -e "
==========LOJA 01=============
$l1printti
==============================
$l1printadm
==============================
$l1printcred
==============================
$l1printdepo
==============================
$l1printrecep
=========LOJA 02==============
$l2printconf
==============================
$l2printrecep
==============================
$l2printdepo
=========LOJA 03==============
$l3printrecep
==============================
$l3printconf
==============================
$l3printdepo
=========LOJA 06==============
$l6printconf
==============================
$l6printdepo
=========LOJA 07==============
$l7printconf
=========MJ & VDF=============
$mjprintcx
==============================
$mjprintvd
==============================
$vdfprintcx
==============================
$vdfprintvd
==============================

       ")" 100 40
}
function contadorestelegram() {
  CURL="/usr/bin/curl"
  BOT_TOKEN='625744069:AAGTXbrysLdWXsapmqhI9SPYpgledYJWPa4'
  USER="-251553925"
  COOKIE="/tmp/telegram_cookie-$(date "+%Y.%m.%d-%H.%M.%S")"

  l1printti="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printti $hname | awk '{ print $4 }' | tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printti $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printti $contador | awk '{ print $4 }')" \
          )"
  l1printadm="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printadm $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printadm $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printadm $contador | awk '{ print $4 }')" \
          )"
  l1printrecep="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1recep $contador | awk '{ print $4 }')" \
          )"
  l1printcred="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1cred $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1cred $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1cred $contador | awk '{ print $4 }')" \
          )"
  l1printdepo="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl1depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl1depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl1depo $contador | awk '{ print $4 }')" \
          )"
  l2printconf="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl2conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl2conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl2conf $contador | awk '{ print $4 }')" \
          )"
  l2printrecep="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl2recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl2recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl2recep $contador | awk '{ print $4 }')" \
          )"
  l2printdepo="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl2depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl2depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl2depo $contador | awk '{ print $4 }')" \
          )"
  l3printrecep="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl3recep $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl3recep $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl3recep $contador | awk '{ print $4 }')\n" \
          )"
  l3printconf="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl3conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl3conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl3conf $contador | awk '{ print $4 }')\n" \
          )"
  l3printdepo="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl3depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl3depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl3depo $contador | awk '{ print $4 }')\n" \
          )"
  l6printconf="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl6conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl6conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl6conf $contador | awk '{ print $4 }')\n" \
          )"
  l6printdepo="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl6depo $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl6depo $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl6depo $contador | awk '{ print $4 }')" \
          )"
  l7printconf="$( \
          echo -e "Impressora: $($snmp $snmpversion $parametro $opt $printl7conf $hname | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Serial: $($snmp $snmpversion $parametro $opt $printl7conf $serial | awk '{ print $4 }'| tr " \" " " ")" && \
          echo -e "Contador: $($snmp $snmpversion $parametro $opt $printl7conf $contador | awk '{ print $4 }')" \
          )"

  SUBJECT=$( echo -e "
  ==========LOJA 01=============
  $l1printti
  ==============================
  $l1printadm
  ==============================
  $l1printcred
  ==============================
  $l1printdepo
  ==============================
  $l1printrecep
  =========LOJA 02==============
  $l2printconf
  ==============================
  $l2printrecep
  ==============================
  $l2printdepo
  =========LOJA 03==============
  $l3printrecep
  ==============================
  $l3printconf
  ==============================
  $l3printdepo
  =========LOJA 06==============
  $l6printconf
  ==============================
  $l6printdepo
  =========LOJA 07==============
  $l7printconf
  ==============================
         ")

${CURL} -k -c ${COOKIE} -b ${COOKIE} -X GET "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage?chat_id=${USER}&text=${SUBJECT}"

}
function contadoresemailbootstrap() {

touch page.html

echo -e "
<!doctype html>
<html lang='pt-br'>
  <head>
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>

    <!-- Bootstrap CSS -->
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>

    <title>Contadores Vale do Para</title>
  </head>" > page.html
echo "
  <body>
    <header>
    <div class>
      <nav class='navbar navbar-expand-lg navbar-dark bg-dark' style='height: 60px;'>
        <img src='https://www.valedopara.com.br/images/min/valezinho.png'>
        <p><h1 style='color: white'> VALE DO PARA CONTADORES<h1></p>
      </nav>
    </div>
    </hea
    der>" >> page.html
echo -e "
    <div class='container-fluid'>
      <div>
          <table class='table'>
          <thead>
            <tr>
              <th scope='col'> # </th>
              <th scope='col'> Loja 01 </th>
              <th scope='col'> Loja 02 </th>
              <th scope='col'> Loja 03 </th>
              <th scope='col'> Loja 06 </th>
              <th scope='col'> Loja 07 </th>
              <th scope='col'> MJ & VF </th>
            </tr>
          </thead>
          <tbody>" >> page.html
        echo -e "<tr>">> page.html
        echo -e "<th scope='row'>1 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printti $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printti $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printti $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl2conf $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl2conf $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl2conf $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl3recep $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl3recep $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl3recep $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl6conf $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl6conf $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl6conf $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl7conf $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl7conf $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl7conf $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printmjcx $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printmjcx $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printmjcx $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<tr>">> page.html
        echo -e "<th scope='row'>2 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printadm $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printadm $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printadm $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl2recep $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl2recep $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl2recep $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl3conf $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl3conf $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl3conf $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl6depo $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl6depo $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl6depo $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printmjvd $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printmjvd $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printmjvd $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<tr>">> page.html
        echo -e "<th scope='row'>3 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl1recep $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl1recep $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl1recep $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl2depo $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl2depo $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl2depo $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl3depo $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl3depo $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl3depo $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printvdfcx $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printvdfcx $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printvdfcx $contador | awk '{ print $4 }')<br></td>" >> page.html

        echo -e "</tr>">> page.html
        echo -e "<tr>">> page.html
        echo -e "<th scope='row'>4 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl1cred $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl1cred $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl1cred $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> ------------- </td>" >> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printvdfvd $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printvdfvd $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printvdfvd $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<tr>">> page.html
        echo -e "<th scope='row'>5 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl1depo $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl1depo $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl1depo $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<th scope='row'>6 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printl1rh $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printl1rh $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printl1rh $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<th scope='row'>7 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printdir1 $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printdir1 $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printdir1 $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<th scope='row'>8 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printtesou $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printtesou $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printtesou $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
        echo -e "<th scope='row'>9 </th>">> page.html
        echo -e "<td scope='col'> Impressora: $($snmp $snmpversion $parametro $opt $printvendext $hname | awk '{ print $4 }' | tr " \" " " ")<br>
                                  Serial: $($snmp $snmpversion $parametro $opt $printvendext $serial | awk '{ print $4 }'| tr " \" " " ")<br>
                                  Contador: $($snmp $snmpversion $parametro $opt $printvendext $contador | awk '{ print $4 }')<br></td>" >> page.html
        echo -e "</tr>">> page.html
echo -e "
          </tbody>
          </table>
        </div>
      </div>
            <p></p>" >> page.html
echo -e "
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script>
  </body>
</html>" >> page.html

emaildestino=$(
dialog \
--title "E-mail Destino" \
--stdout \
--backtitle "Sistema Capturador de Contadores" \
--inputbox "Digite e-mail de Destino:" 0 0)

mailx -a "Content-type: text/html;" -s "[TESTE]Contadores das Impressoras" "$emaildestino" <page.html
}
#-------------------MENU---------------------------

while true;
    do
  menu=$(dialog --stdout --title "Menu Principal" --backtitle "Sistema Capturador de Contadores" \
        --menu "Escolha uma opção:" 0 0 0 \
        1 "Capturar Contadores Mostrar em Tela"       \
        2 "Capturar Contadores Enviar Telegram"       \
        3 "Capturar Contadores Enviar via E-mail"     \
        0 "Sair"                                )

        #[ $? -ne 0 ] && "Cancelou ou Apertou ESC." && break

          case "$menu" in
                  1) printname;;
                  2) contadorestelegram;;
                  3) contadoresemailbootstrap;;
                  0) exit;;
          esac
  done
