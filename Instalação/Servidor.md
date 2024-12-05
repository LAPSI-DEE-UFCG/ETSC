# Guia de Instalação do GNS3 (Servidor)

### Servidor Instalado no Host
Nesta configuração, o software **GNS3 Servidor** é instalado em um sistema operacional Linux.

Essa opção é recomendada para:
- Servidores dedicados que atuarão exclusivamente como hosts para simulações GNS3.
- **Requisitos de conhecimento:** nível intermediário ou avançado.

### Recursos e Observações
- Exige a instalação manual de máquinas virtuais (VirtualBox, VMware ou QEMU) e contêineres.
- O acesso ao servidor será realizado de forma segura via túnel SSH utilizando o software **X2Go**.
- **Consumo de recursos:** todas as máquinas virtuais e contêineres utilizados nas topologias de rede criadas no GNS3 consumirão os recursos do host.

---

## Requisitos do Sistema

### Configuração Mínima
- **Processador:** 4 núcleos.
- **Memória RAM:** 8 GB.
- **Armazenamento:** 50 GB livres.
- **Sistema Operacional:** Ubuntu 20.04 LTS.

### Configuração Recomendada
- **Processador:** 6 núcleos.
- **Memória RAM:** 16 GB.
- **Armazenamento:** 100 GB livres.
- **Sistema Operacional:** Ubuntu 20.04 LTS.

---

## Instalação no Ubuntu 20.04 (Servidor)

### Passos de Instalação

#### **Passo 1: Adicionar Repositórios e Instalar Dependências**
Execute os comandos abaixo para adicionar os repositórios necessários, atualizar a base de pacotes e instalar os softwares:

```bash
sudo add-apt-repository ppa:gns3/ppa
sudo apt update
sudo apt -y install gns3-gui gns3-server

sudo dpkg --add-architecture i386
sudo apt update
sudo apt -y install gns3-iou

sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli
```

#### **Passo 2: Criar Usuários e Configurar Permissões**
Crie novos usuários (caso necessário) e atribua permissões adequadas. Substitua USUÁRIO pelo nome do usuário desejado:

```bash
sudo useradd -m USUÁRIO

for i in ubridge libvirt kvm wireshark docker gns3; do
    sudo usermod -aG $i USUÁRIO
done
```

#### **Passo 3: Configurar o Servidor**
Para configurar o servidor, preencha os seguintes campos com os valores apropriados para sua rede:

- **Host:** Endereço IP ou hostname do servidor.
- **Port:** Porta utilizada para a conexão (padrão: `3080`).
- **Auth:** Habilite a autenticação.
- **User:** Defina o nome de usuário para a conexão.
- **Password:** Configure a senha correspondente.

Edite o arquivo de configuração com os valores desejados. Para acessar o arquivo, utilize o seguinte comando:

```bash
sudo nano ~/.config/GNS3/2.2/gns3_server.conf
```

#### **Passo 4: Iniciar o Servidor**
Para iniciar o servidor, execute o seguinte comando no terminal:

```bash
gns3server
```

## Instalação do X2Go

O **X2Go** é utilizado para acessar o servidor de forma remota, com interface gráfica segura via túnel SSH. A seguir, são apresentados os passos para instalação e configuração do **X2Go Servidor** no Linux e do **X2Go Cliente** em sistemas Linux, Windows ou macOS.

### Instalação do Servidor X2Go no Linux

No servidor, execute os seguintes comandos para instalar o **X2Go Servidor** e as dependências necessárias:

```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:x2go/stable
sudo apt update
sudo apt -y install x2goserver x2goserver-xsession

sudo apt -y install xfce4 xfce4-goodies
sudo apt -y install tigervnc-standalone-server tigervnc-viewer
```

### Instalação do Cliente X2Go

O **X2Go Cliente** é utilizado para acessar remotamente o servidor com interface gráfica via túnel SSH. A seguir, são apresentados os passos para instalação do cliente em sistemas Linux, Windows e macOS.

#### Instalação em Linux

#### **Passo 1: Atualize a base de pacotes do sistema e instalar o cliente X2Go**
Execute os seguintes comandos para atualizar o repositórios e instalar o cliente:
   ```bash
   sudo apt update
   sudo apt install -y x2goclient
   ```

#### Instalação em Windows e macOS

#### **Passo 1: Acesse a página oficial do X2Go Cliente**
1. Acesse a página oficial do X2Go em [https://wiki.x2go.org/doku.php/doc:installation:x2goclient/]([https://www.gns3.com](https://wiki.x2go.org/doku.php/doc:installation:x2goclient)/).
2. Faça o download do instalador apropriado para o seu sistema operacional.

#### **Passo 2: Instalar o Software**
1. Após o download ser concluído, execute o instalador.
2. Siga as instruções apresentadas pelo assistente de instalação para concluir o processo.

### Configuração do Cliente X2Go

Após a instalação, é necessário configurar o X2Go Cliente para conectar ao servidor remoto. A seguir, estão os passos para realizar a configuração.

#### **Passo 1: Abra o X2Go Cliente**
Inicie o **X2Go Cliente** em seu sistema.

#### **Passo 2: Crie uma nova sessão**
Clique em **Session > New session...** para criar uma nova sessão de conexão.

#### **Passo 3: Preencha os campos da nova sessão**
Preencha os seguintes campos com as informações do servidor:

- **Session name**: Escolha um nome de identificação para a sessão.
- **Host**: Informe o IP ou hostname do servidor (exemplo: 192.168.1.19).
- **Login**: Insira seu nome de usuário para o acesso.
- **Session type**: Selecione a opção **XFCE**.

#### **Passo 4: Salve a configuração**
Clique em **OK** para salvar a nova configuração de sessão.

#### **Passo 5: Conecte-se ao servidor**
Clique no ícone da sessão criada e insira a senha fornecida pelo administrador do servidor.

**Nota**: É recomendável alterar a senha padrão no primeiro acesso. Para isso, abra um terminal no servidor e execute o comando:
   ```bash
   passwd
   ```

## Finalizando a Sessão

Para encerrar a sessão de forma segura. A seguir, estão os passos para encerrar a sessão.

#### **Passo 1: Retorne ao cliente X2Go**
Volte para a interface do **X2Go Cliente**.

#### **Passo 2: Clique no botão Terminate**
Clique no botão **Terminate** (ícone de ligar/desligar) para finalizar a sessão.

Com isso, a sessão será encerrada de forma segura, e o cliente X2Go estará pronto para uso posterior.
