FROM cm2network/steamcmd:latest

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "SatisfactoryDedicatedServer"

ENV USER steam
USER ${USER}

ENV WORKDIR "/home/${USER}/satisfactory"
WORKDIR ${WORKDIR}

COPY --chown=${USER}:${USER} ./entrypoint.sh ${WORKDIR}/entrypoint.sh
COPY --chown=${USER}:${USER} ./init.sh ${WORKDIR}/init.sh
COPY --chown=${USER}:${USER} ./gameserver.sh ${WORKDIR}/gameserver.sh

RUN chmod +x "${WORKDIR}/entrypoint.sh" "${WORKDIR}/init.sh" "${WORKDIR}/gameserver.sh"

VOLUME "${WORKDIR}/${STEAMAPPDIR}"

EXPOSE 7777/udp 15000/udp 15777/udp

ENTRYPOINT [ "./entrypoint.sh" ]
