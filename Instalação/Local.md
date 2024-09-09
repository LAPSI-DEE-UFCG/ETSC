Servidor e cliente instalados no mesmo host: os softwares GNS3 Cliente e GNS3 Servidor estão instalados no mesmo sistema operacional (Windows, Mac, Linux, ...); recomenda-se essa opção para usuário único ou multiusuários – desde que estejam contidos na mesma máquina – mas com conhecimento intermediário ou avançado, pois terá(ão) que instalar os softwares para utilização de máquinas virtuais (VirtualBox, VMWare ou Qemu) e contêineres manualmente; os recursos ofertados pelo GNS3 Servidor estarão disponíveis ao GNS3 Cliente dentro da rede local de sua máquina, criada pelo sistema operacional (localhost ou 127.x.x.x); todas as máquinas virtuais  e contêineres utilizados dentro das topologias de rede criadas dentro do ambiente GNS3 consumirão os recursos da máquina; 

Configuração Mínima:
Processador quadcore;
8 GB de RAM;
50 GB de Armazenamento livres;
Ubuntu 20.04 LTS ou Windows 10.

## INSTALAÇÃO NO UBUNTU 20.04 OU POSTERIOR

Os programas GNS3 Cliente e GNS3 Servidor serão instalados com base na documentação oficial disponível no site do GNS3. Em seguida, serão criados grupos de permissões e usuários com direitos de convidado para os participantes do curso que farão uso da ferramenta. Os usuários serão incluídos nesses grupos para que possam aproveitar ao máximo os recursos do GNS3. Os passos usados para a instalação e configuração do GNS3 Cliente e GNS3 Servidor são apresentados a seguir:

a)  **Passo 1** - Adição dos repositórios necessários à base de dados do gerenciador de pacotes do Linux Ubuntu, atualização da base de dados e instalação do GNS3 Cliente, GNS3 Servidor e Docker Engine: 
    $ sudo add-apt-repository ppa:gns3/ppa 
    $ sudo apt update 
    $ sudo apt -y install gns3-gui gns3-server 

    $ sudo dpkg --add-architecture i386 
    $ sudo apt update 
    $ sudo apt -y install gns3-iou 

    $ sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common  
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 

    $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
    $ sudo apt update 
    $ sudo apt -y install docker-ce docker-ce-cli 

b)  **Passo 2** – Criação dos usuários, atribuição de senha padrão (etsc@lapsi) e adição aos grupos de permissões. Os campos 'USUÁRIO' devem ser preenchidos com o nome desejado para cada usuário: 
    $ sudo useradd –m USUÁRIO 
    $ sudo passwd etsc@lapsi 

    $ for i in ubridge libvirt kvm wireshark docker gns3; do 
    $ sudo usermod -aG $i USUÁRIO 
    $ done 