#!/bin/bash

# Make sure savegames-dirs are present
test -d ${WORKDIR}/.config/Epic/FactoryGame/Saved || mkdir -p ${WORKDIR}/.config/Epic/FactoryGame/Saved
test -d ${WORKDIR}/${STEAMAPPDIR}/saves || mkdir ${WORKDIR}/${STEAMAPPDIR}/saves
test -L ${WORKDIR}/.config/Epic/FactoryGame/Saved/SaveGames || ln -s ${WORKDIR}/${STEAMAPPDIR}/saves ${WORKDIR}/.config/Epic/FactoryGame/Saved/SaveGames

#Install/Update the game
echo "Hello"
steamcmd +login anonymous +force_install_dir ${WORKDIR}/${STEAMAPPDIR} +app_update ${STEAMAPPID} validate +quit
echo "Hello2"