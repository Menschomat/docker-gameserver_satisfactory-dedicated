FROM steamcmd/steamcmd:alpine
RUN  steamcmd +login anonymous +force_install_dir ~/SatisfactoryDedicatedServer +app_update 1690800 validate +quit
EXPOSE 7777/udp 15000/udp 15777/udp