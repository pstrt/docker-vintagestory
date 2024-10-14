# ============== download stage ==================
FROM debian:latest as downloader

WORKDIR /download

ARG vs_type=pre
ARG vs_os=linux-x64
ARG vs_version=1.20.0-pre.6

RUN apt update
RUN apt install -y wget

# ============== download base ==================

RUN wget "https://cdn.vintagestory.at/gamefiles/${vs_type}/vs_server_${vs_os}_${vs_version}.tar.gz"
RUN tar -xvzf "vs_server_${vs_os}_${vs_version}.tar.gz"
RUN rm "vs_server_${vs_os}_${vs_version}.tar.gz"

# ============== patch for arm64 ==================

RUN rm -rf VintagestoryServer VintagestoryServer.deps.json VintagestoryServer.dll VintagestoryServer.pdb VintagestoryServer.runtimeconfig.json Lib
RUN wget "https://github.com/anegostudios/VintagestoryServerArm64/files/12380878/vs_server_linux-arm64.tar.gz"
RUN tar -xvzf "vs_server_linux-arm64.tar.gz"
RUN mkdir arm64beta
RUN tar -xvzf "vs_server_linux-arm64.tar.gz" -C arm64beta
RUN cp -r arm64beta/server/. .
RUN rm -rf vs_server_linux-arm64.tar.gz arm64beta

# ============== runtime stage ==================
FROM mcr.microsoft.com/dotnet/sdk:7.0 as runtime
WORKDIR /game
# Defaults
ENV VS_DATA_PATH=/gamedata/vs
COPY --from=downloader "./download/" "/game"

#  Expose ports
EXPOSE 42420/tcp

# Execution command
CMD  dotnet VintagestoryServer.dll --dataPath $VS_DATA_PATH
