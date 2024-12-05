# Guia de Instalação do GNS3 (Cliente e Servidor)

## Configurações Possíveis

### Servidor e Cliente Instalados no mesmo host
Nesta configuração, os softwares **GNS3 Cliente** e **GNS3 Servidor** são instalados no mesmo sistema operacional (Windows, Mac ou Linux).

Essa opção é recomendada para:
- **Usuário único** ou **multiusuários** contidos na mesma máquina.
- **Requisitos de conhecimento:** nível intermediário ou avançado.

### Recursos e Observações
- Exige a instalação manual de máquinas virtuais (VirtualBox, VMware ou QEMU) e contêineres.
- Os recursos do GNS3 Servidor estarão disponíveis para o GNS3 Cliente na rede local da máquina (localhost ou 127.x.x.x).
- **Consumo de recursos:** todas as máquinas virtuais e contêineres utilizados nas topologias de rede criadas no GNS3 consumirão os recursos do host.

---

## Requisitos do Sistema

### Configuração Mínima
- **Processador:** 4 núcleos.
- **Memória RAM:** 8 GB.
- **Armazenamento:** 50 GB livres.
- **Sistema Operacional:** Ubuntu 20.04 LTS ou Windows 10/11.

### Configuração Recomendada
- **Processador:** 6 núcleos.
- **Memória RAM:** 16 GB.
- **Armazenamento:** 100 GB livres.
- **Sistema Operacional:** Ubuntu 20.04 LTS ou Windows 10/11.

---

## Instalação no Ubuntu 20.04

A instalação do **GNS3 Cliente** e **GNS3 Servidor** segue a documentação oficial do site do GNS3. Após a instalação, serão criados grupos de permissões e usuários com direitos adequados para acesso à ferramenta.

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

#### **Passo 3: Iniciar o simulador**
Execute o comando abaixo para iniciar o simulador:

```bash
gns3
```

## Instalação no Windows 10 ou Superior

### Passos de Instalação

#### **Passo 1: Baixar o Instalador**
1. Acesse a página oficial do GNS3 em [https://www.gns3.com/](https://www.gns3.com/).
2. Faça o download do instalador apropriado para o seu sistema operacional.  
   > **Nota:** Pode ser necessário criar uma conta no site para realizar o download.

#### **Passo 2: Instalar o Software**
1. Após o download ser concluído, execute o instalador.
2. Siga as instruções apresentadas pelo assistente de instalação para concluir o processo.

#### **Passo 3: Iniciar o GNS3**
1. Após a instalação ser concluída com sucesso, inicie o GNS3 normalmente através do atalho criado no desktop ou no menu iniciar.

---

Se houver dúvidas ou dificuldades durante a instalação, consulte a [documentação oficial](https://docs.gns3.com/) ou o fórum da comunidade GNS3 para obter suporte.
