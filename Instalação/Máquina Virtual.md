# Guia de Instalação do ETSC via Máquina Virtual

O **ETSC** é um emulador voltado para treinamentos em segurança cibernética, permitindo a execução de cenários de simulação de cibersegurança. Para acessar o ambiente de simulação, é necessário configurar uma máquina virtual (VM) desenvolvida para uso com o **VirtualBox (VB)**.

### Cliente e Servidor em Máquina Virtual
Nesta configuração, tanto o cliente quanto o servidor do ETSC estão instalados na mesma máquina virtual, garantindo maior portabilidade e facilidade na configuração.

Essa opção é recomendada para:
- Usuários que desejam um ambiente isolado e configurado previamente.
- Estudantes e profissionais participando de cursos ou treinamentos específicos.

### Recursos e Observações
- **Ambientes disponíveis:** 
  - Ferramentas para Cibersegurança.
  - Red Team.
  - Blue Team.
- O consumo de recursos será gerenciado diretamente pela máquina virtual no sistema host.
- A máquina virtual foi otimizada para garantir compatibilidade com o **VirtualBox**.

---

## Requisitos do Sistema

### Configuração Mínima
- **Processador:** Quad-core, 2.0 GHz.
- **Memória RAM:** 8 GB.
- **Armazenamento:** 85 GB livres.
- **Sistema Operacional Host:** Windows 10/11, macOS, ou Linux.

### Configuração Recomendada
- **Processador:** Hexa-core, 2.5 GHz ou superior.
- **Memória RAM:** 12 GB ou mais.
- **Armazenamento:** 100 GB livres.
- **Sistema Operacional Host:** Windows 10/11, macOS, ou Linux.

---

## Passos de Instalação

### **Passo 1: Instalar o VirtualBox**
1. Acesse o site oficial do VirtualBox e faça o download do instalador para o seu sistema operacional:  
   [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
2. Execute o instalador e siga as instruções apresentadas no assistente de instalação para concluir o processo.

### **Passo 2: Baixar a Máquina Virtual (VM)**
Escolha o ambiente desejado para simulação e faça o download da máquina virtual nos links abaixo:  
- **Ferramentas para Cibersegurança:**  
  [https://lapsicloud.ddns.net/index.php/s/AnDJxcJ9QtG69G5](https://lapsicloud.ddns.net/index.php/s/AnDJxcJ9QtG69G5)  
- **Red Team:**  
  [https://lapsicloud.ddns.net/index.php/s/JQwYmDJkEBYSAmj](https://lapsicloud.ddns.net/index.php/s/JQwYmDJkEBYSAmj)  
- **Blue Team:**  
  [https://lapsicloud.ddns.net/index.php/s/J4W5mF3q7A9LmgM](https://lapsicloud.ddns.net/index.php/s/J4W5mF3q7A9LmgM)

### **Passo 3: Importar a Máquina Virtual no VirtualBox**
1. Após o download do arquivo `.ova`, abra a interface do VirtualBox (VB).  
2. Clique em `Arquivo` → `Importar Appliance...`.  
3. Na janela que será exibida, clique em `Escolha um arquivo para importar o appliance virtual...` (ícone de pasta com uma seta verde).  
4. Navegue até o diretório onde o arquivo `.ova` foi salvo, selecione o arquivo e clique em `Abrir`.  
5. Clique em `Próximo` e revise as configurações da máquina virtual.  
6. Por fim, clique em `Importar` para concluir o processo.

### **Passo opcional: Adição de Recursos Computacionais à VM**
Caso sua máquina host atenda aos requisitos recomendados, siga os passos abaixo para otimizar a performance da VM:  
1. Clique com o botão direito na instância da VM e selecione `Configurações`.  
2. No menu lateral, acesse `Sistema` → aba `Placa-Mãe` e ajuste o campo `Memória Base` para `6144 MB`.  
3. Em seguida, vá para `Sistema` → aba `Processador` e ajuste o campo `Processadores` para `4` ou `5`, dependendo das capacidades do seu processador.  
4. Por fim, clique em **OK** para salvar e aplicar as alterações.  

### **Passo 4: Iniciar o Ambiente de Simulação**
1. No VirtualBox, selecione a máquina virtual importada e clique em **Iniciar**.  
2. Quando solicitado, insira as credenciais de acesso:  
   - **Usuário:** `ETSC`  
   - **Senha:** `etsc@lapsi`  

### **Passo 5: Abrir o GNS3 e Selecionar a Topologia**
1. Após iniciar a VM, clique duas vezes no ícone do **GNS3** localizado na área de trabalho.  
2. Escolha a topologia desejada para iniciar o ambiente de simulação.

## Guia para Execução dos Cenários
Para obter detalhes sobre a execução dos cenários e tarefas, acesse o guia oficial:  
[https://etsc.cyberedu.com.br/](https://etsc.cyberedu.com.br/)
