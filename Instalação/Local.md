# Guia de Instalação do GNS3 (Cliente e Servidor)

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

### Configuração do GNS3 para execução de contêineres

Após o download e instalação do **GNS3**, siga os passos abaixo para configurar o ambiente para uso de containers em sistemas Windows. Essa configuração utiliza a **VM do GNS3** como servidor local para execução de containers, QEMUs e outros recursos avançados.

#### **Passo 1: Instalar o VMware Workstation ou Fusion**
1. Baixe e instale o **VMware Workstation ou Fusion** a partir do site oficial:  
   [https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)
2. Siga as instruções do instalador para concluir a instalação.

#### **Passo 2: Fazer o download da VM do GNS3**
1. Acesse a página oficial para download da VM do GNS3:  
   [https://gns3.com/software/download-vm](https://gns3.com/software/download-vm)
2. Na página de download, selecione a opção **VMware Workstation and Fusion**.
3. Após o download, descompacte o arquivo `.zip`.

#### **Passo 3: Importar e configurar a VM do GNS3**
1. Inicie o VMware e clique em `Open a Virtual Machine`, navegue até o diretório onde o arquivo `.zip` foi extraído e selecione o arquivo `GNS3 VM.ova`.
2. Insira o nome que desejar para identificar essa VM e selecione `Import`.
3. Após a importação, clique em `Edit virtual machine settings` → `Processors`, desmarque a opção `Virtualize Intel VT-x/EPT or AMD-V/RVI` e clique em **OK**.
4. Inicie a VM clicando em `Play virtual machine`.

#### **Passo 4: Configurar o servidor remoto no GNS3**
1. Retorne ao sistema hospedeiro e abra o **GNS3**.
2. Durante a configuração inicial ou ao adicionar um novo servidor, selecione a opção:  
   **Run appliances on a remote server (advanced usage)**.
3. Preencha os campos de configuração com as informações exibidas na tela de inicialização da VM:
   - **Host**: Endereço IP da VM do GNS3.
   - **Port**: Porta padrão (usualmente `80`).
   - **User**: Nome de usuário exibido pela VM (padrão: `admin`).
   - **Password**: Senha correspondente (padrão: `gns3`).

#### **Passo 5: Verificar a conexão**
1. Teste a conexão com o servidor remoto clicando em **Test Settings**.
2. Após verificar a conexão bem-sucedida, finalize a configuração.

---

Com a VM configurada como servidor remoto, o ambiente do GNS3 estará pronto para uso com containers, QEMUs e outros recursos avançados.
Se houver dúvidas ou dificuldades durante a instalação, consulte a [documentação oficial](https://docs.gns3.com/) ou o fórum da comunidade GNS3 para obter suporte.
