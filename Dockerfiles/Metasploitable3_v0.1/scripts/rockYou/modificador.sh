#!/bin/bash
 # Inicia serviço ssh
service ssh start
# Arquivo de lista de senhas
PASSWORD_LIST="rockyou.txt"

# Função para obter um item aleatório de um arquivo
get_random_item() {
  local file="$1"
  shuf -n 1 "$file"
}

# Definindo nova senha aleatoriamente
NOVA_SENHA=$(get_random_item "$PASSWORD_LIST")

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

service ssh restart
# Mensagem de confirmação
echo "A senha do usuário foi alterada."

exit 0

