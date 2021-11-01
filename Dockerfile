FROM steamcmd/steamcmd:ubuntu-20

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "SatisfactoryDedicatedServer"
ENV USER satisfactory
ENV WORKDIR "/home/satisfactory"

RUN useradd -rm -d /home/satisfactory -s /bin/bash -u 1001 satisfactory
USER ${USER}
WORKDIR ${WORKDIR}

COPY --chown=${USER}:${USER} ./entrypoint.sh ${WORKDIR}/entrypoint.sh
COPY --chown=${USER}:${USER} ./init.sh ${WORKDIR}/init.sh
COPY --chown=${USER}:${USER} ./gameserver.sh ${WORKDIR}/gameserver.sh

RUN chown -R "${USER}:${USER}" "${WORKDIR}"
RUN chmod +x "${WORKDIR}/entrypoint.sh"
RUN chmod +x "${WORKDIR}/init.sh"
RUN chmod +x "${WORKDIR}/gameserver.sh"

VOLUME [ "${WORKDIR}/SatisfactoryDedicatedServer",  ]



EXPOSE 7777/udp 15000/udp 15777/udp