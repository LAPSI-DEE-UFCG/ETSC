#!/bin/bash
service ssh start
# Array de senhas
PASSWORDS=(
  "c1sa"
  "p2ao"
  "a3le"
  "m4or"
  "v5er"
  "s6ol"
  "d7ia"
  "g8as"
  "f9lo"
  "r0sa"
  "a1mo"
  "b2ol"
  "t3er"
  "j4oi"
  "p5az"
  "m6eu"
  "r7io"
  "v8en"
  "a9ce"
  "d0os"
  "p1ar"
  "n2uv"
  "e3st"
  "r4ua"
  "f5oz"
  "l6ua"
  "b7oa"
  "m8ar"
  "v9oz"
  "s0eu"
  "t1al"
  "c2or"
  "d3el"
  "j4ar"
  "p5er"
  "m6il"
  "v7ir"
  "a8la"
  "b9os"
  "t0om"
  "a@1b"
  "c#2d"
  "e$3f"
  "g%4h"
  "i^5j"
  "k&6l"
  "m*7n"
  "o(8p"
  "q)9r"
  "s!0t"
)

# Função para obter um item aleatório de um array
get_random_item() {
  local array=("$@")
  local index=$((RANDOM % ${#array[@]}))
  echo "${array[$index]}"
}

# Definindo nova senha aleatoriamente
NOVA_SENHA=$(get_random_item "${PASSWORDS[@]}")

# Verificando se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
  echo "Por favor, execute este script como root"
  exit 1
fi

# Verificando se o usuário msfadmin existe
if id "msfadmin" >/dev/null 2>&1; then
  echo "OK"
else
  echo "O usuário msfadmin não existe."
  exit 1
fi

# Alterando a senha do usuário msfadmin
echo "msfadmin:$NOVA_SENHA" | chpasswd

# Mensagem de confirmação
echo "A senha do usuário msfadmin foi alterada."

# Atualizando o arquivo /etc/ssh/sshd_config
SSHD_CONFIG="/etc/ssh/sshd_config"

# Fazendo backup do arquivo original
cp $SSHD_CONFIG ${SSHD_CONFIG}.bak

# Substituindo o conteúdo do arquivo sshd_config
cat > $SSHD_CONFIG <<EOL
# Package generated configuration file
# See the sshd_config(5) manpage for details

# What ports, IPs and protocols we listen for
Port 22
# Use these options to restrict which interfaces/protocols sshd will bind to
#ListenAddress ::
#ListenAddress 0.0.0.0
Protocol 2
# HostKeys for protocol version 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
#Privilege Separation is turned on for security
UsePrivilegeSeparation yes

# Lifetime and size of ephemeral version 1 server key
KeyRegenerationInterval 3600
ServerKeyBits 1024

# Logging
SyslogFacility AUTH
LogLevel INFO

# Authentication:
PermitRootLogin without-password
StrictModes yes
LoginGraceTime 1200
#PermitRootLogin prohibit-password
#StrictModes yes
MaxAuthTries 10000
MaxSessions 100000

RSAAuthentication yes
PubkeyAuthentication yes
#AuthorizedKeysFile     %h/.ssh/authorized_keys

# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes
# For this to work you will also need host keys in /etc/ssh_known_hosts
RhostsRSAAuthentication no
# similar for protocol version 2
HostbasedAuthentication no
# Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication
#IgnoreUserKnownHosts yes

# To enable empty passwords, change to yes (NOT RECOMMENDED)
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Change to no to disable tunnelled clear text passwords
#PasswordAuthentication yes

# Kerberos options
#KerberosAuthentication no
#KerberosGetAFSToken no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes

X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no

#MaxStartups 1000:300:20000
#Banner /etc/issue.net

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

Subsystem sftp /usr/lib/openssh/sftp-server

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM no
EOL

# Mensagem de confirmação
echo "atualizadas."

# Reiniciando o serviço SSH para aplicar as novas configurações
service ssh restart

exit 0

