#!/bin/bash
set -e
#/opt/satisfactory/SatisfactoryDedicatedServer/FactoryServer.sh
cd ${WORKDIR}/${STEAMAPPDIR}/ || exit 1
if [ ! -f "Engine/Binaries/Linux/UE4Server-Linux-Shipping" ]; then
    printf "Game binary is missing.\\n"
    exit 1
fi
Engine/Binaries/Linux/UE4Server-Linux-Shipping FactoryGame -log -NoSteamClient -unattended