FROM steamcmd/steamcmd:alpine

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "SatisfactoryDedicatedServer"

ENV USER satisfactory
RUN addgroup -S satisfactory && adduser -S satisfactory -G satisfactory --disabled-password
USER ${USER}

ENV WORKDIR "/home/satisfactory"
WORKDIR ${WORKDIR}

COPY --chown=${USER}:${USER} ./entrypoint.sh ${WORKDIR}/entrypoint.sh
COPY --chown=${USER}:${USER} ./init.sh ${WORKDIR}/init.sh
COPY --chown=${USER}:${USER} ./gameserver.sh ${WORKDIR}/gameserver.sh

RUN chown -R "${USER}:${USER}" "${WORKDIR}"
RUN chmod +x "${WORKDIR}/entrypoint.sh" "${WORKDIR}/init.sh" "${WORKDIR}/gameserver.sh"

VOLUME [ "${WORKDIR}/SatisfactoryDedicatedServer",  ]

EXPOSE 7777/udp 15000/udp 15777/udp