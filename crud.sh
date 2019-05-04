#!/usr/bin/env bash

# crud.sh - Ferramenta para controle de inventário
#
# crud.sh - cadastro, listagem, update e delete.
#
# Site:       https://wesllenmatias.com.br
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

function Cad_Marca() {
  yad --title "Cadastro de Marca" \
  --width=400 \
  --height=200 \
  --center \
  --form \
  --field="Descrição:" \
  --button=gtk-save:0
}

function Cadastro_Modelo() {
  yad --title "Cadastro de Modelo" \
  --width=400 \
  --height=200 \
  --center \
  --form \
  --field="Descrição do Modelo:" \
  --button=gtk-save:0
}

function Entrada() {
  yad --title "Entrada no Inventário" \
  --width=400 \
  --height=200 \
  --center \
  --form \
  --field="Marca":CB DELL\!HP\!MIRANDA \
  --field="Modelo":CB DESKTOP\!NOTEBOOK\!RASPBERRY \
  --field="Descrição do Equipamento:" \
  --field="Data de entrada:":DT \
  --field="N/S:" \
  --field="Quantidade:":num
}

export -f Cad_Marca
export -f Cadastro_Modelo
export -f Entrada

yad --title "Inventário" \
--center \
--buttons-layout start \
--button="Cadastro de Marca":"bash -c Cad_Marca" \
--button="Cadastro de Modelo":"bash -c Cadastro_Modelo" \
--button="Cadastrar Entrada":"bash -c Entrada" 0 0 0
