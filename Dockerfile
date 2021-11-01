FROM steamcmd/steamcmd:ubuntu-20

USER ${USER}
ENV STEAMAPPID 1690800
ENV STEAMAPP Satisfactory
ENV STEAMAPPDIR "SatisfactoryDedicatedServer"

COPY ./entrypoint.sh ~/entrypoint.sh
COPY ./init.sh ~/init.sh
COPY ./gameserver.sh ~/gameserver.sh
RUN chown -R "${USER}:${USER}" "~/"
RUN chmod +x "~/entry.sh"
RUN chmod +x "~/init.sh"
RUN chmod +x "~/gameserver.sh"

VOLUME [ "~/SatisfactoryDedicatedServer",  ]

EXPOSE 7777/udp 15000/udp 15777/udp