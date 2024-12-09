# Use a imagem base do Ubuntu
FROM ubuntu:20.04

LABEL version="Velociraptor v0.72.0-1"
LABEL description="Velociraptor server in a Docker container"
LABEL maintainer="Wes Lambert, @therealwlambert"

# Copie o script de entrada
COPY ./entrypoint .

# Defina variáveis de ambiente (essas podem ser configuradas durante a construção)
ENV VELOX_USER=${VELOX_USER}
ENV VELOX_PASSWORD=${VELOX_PASSWORD}
ENV VELOX_ROLE=${VELOX_ROLE}
ENV VELOX_SERVER_URL=${VELOX_SERVER_URL}
ENV VELOX_FRONTEND_HOSTNAME=${VELOX_FRONTEND_HOSTNAME}

# Instale dependências e configure o Velociraptor
RUN chmod +x entrypoint && \
    apt-get update && \
    apt-get install -y curl wget jq rsync firefox && \
    # Create dirs for Velo binaries
    mkdir -p /opt/velociraptor && \
    for i in linux mac windows; do mkdir -p /opt/velociraptor/$i; done && \
    # Get Velox binaries
    WINDOWS_EXE=$(curl -s https://api.github.com/repos/velocidex/velociraptor/releases/latest | jq -r '[.assets | sort_by(.created_at) | reverse | .[] | .browser_download_url | select(test("windows-amd64.exe$"))][0]') && \
    WINDOWS_MSI=$(curl -s https://api.github.com/repos/velocidex/velociraptor/releases/latest | jq -r '[.assets | sort_by(.created_at) | reverse | .[] | .browser_download_url | select(test("windows-amd64.msi$"))][0]') && \
    LINUX_BIN=$(curl -s https://api.github.com/repos/velocidex/velociraptor/releases/latest | jq -r '[.assets | sort_by(.created_at) | reverse | .[] | .browser_download_url | select(test("linux-amd64$"))][0]') && \
    MAC_BIN=$(curl -s https://api.github.com/repos/velocidex/velociraptor/releases/latest | jq -r '[.assets | sort_by(.created_at) | reverse | .[] | .browser_download_url | select(test("darwin-amd64$"))][0]') && \
    wget -O /opt/velociraptor/linux/velociraptor "$LINUX_BIN" && \
    wget -O /opt/velociraptor/mac/velociraptor_client "$MAC_BIN" && \
    wget -O /opt/velociraptor/windows/velociraptor_client.exe "$WINDOWS_EXE" && \
    wget -O /opt/velociraptor/windows/velociraptor_client.msi "$WINDOWS_MSI" && \
    # Clean up
    apt-get remove -y --purge wget && \
    apt-get clean

# Copie o diretório de configuração do Velociraptor
COPY velociraptor /velociraptor

# Exponha as portas necessárias
EXPOSE 8000 8001 8889

# Defina o diretório de trabalho
WORKDIR /velociraptor

# Comando de inicialização padrão
CMD ["/entrypoint"]

