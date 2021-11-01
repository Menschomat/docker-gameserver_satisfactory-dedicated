FROM steamcmd/steamcmd:alpine

ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "SatisfactoryDedicatedServer"

RUN apk add --no-cache su-exec

ENV USER satisfactory
RUN addgroup -S satisfactory
RUN adduser -S satisfactory -G satisfactory --disabled-password


ENV WORKDIR "/home/satisfactory"
WORKDIR ${WORKDIR}



COPY --chown=${USER}:${USER} ./entrypoint.sh ${WORKDIR}/entrypoint.sh
COPY --chown=${USER}:${USER} ./init.sh ${WORKDIR}/init.sh
COPY --chown=${USER}:${USER} ./gameserver.sh ${WORKDIR}/gameserver.sh

RUN chown -R "${USER}:${USER}" "${WORKDIR}"
RUN chmod +x "${WORKDIR}/entrypoint.sh" "${WORKDIR}/init.sh" "${WORKDIR}/gameserver.sh"

VOLUME [ "${WORKDIR}/${STEAMAPPDIR}",  ]

EXPOSE 7777/udp 15000/udp 15777/udp

ENTRYPOINT [ "./entrypoint.sh" ]
