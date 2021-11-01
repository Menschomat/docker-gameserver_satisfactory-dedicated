#!/bin/bash

# Make sure savegames-dirs are present
test -d ~/.config/Epic/FactoryGame/Saved || mkdir -p ~/.config/Epic/FactoryGame/Saved
test -d ${WORKDIR}/${STEAMAPPDIR}/saves || mkdir ${WORKDIR}/${STEAMAPPDIR}/saves
test -L ~/.config/Epic/FactoryGame/Saved/SaveGames || ln -s ${WORKDIR}/${STEAMAPPDIR}/saves ~/.config/Epic/FactoryGame/Saved/SaveGames

#Install/Update the game
ls /home/steam/
/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${WORKDIR}/${STEAMAPPDIR} +app_update ${STEAMAPPID} validate +quit