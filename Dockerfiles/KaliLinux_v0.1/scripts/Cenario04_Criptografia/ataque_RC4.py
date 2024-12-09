from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.ciphers import Cipher
from cryptography.hazmat.primitives.ciphers.algorithms import ARC4


def rc4_decrypt_bruteforce(ciphertext, key_space):
    """Tenta decriptar o texto cifrado RC4 usandon forca bruta.

    Args:
        ciphertext: Conteudo do arquivo encriptado em bytes.
        key_space: Uma lista de possiveis chaves.

    Returns:
        O texto claro decriptado se uma chave for encontrada, caso contrario None.
    """
    for key in key_space:
        print(f"Tentando chave: {key}")  # Adicionando depuracao
        try:
            cipher = Cipher(ARC4(key), mode=None, backend=default_backend())
            decryptor = cipher.decryptor()
            plaintext = decryptor.update(ciphertext) + decryptor.finalize()
            print(f"Texto claro obtido com a chave {key}: {plaintext}")  # Adicionando depuracao

            # Verificar se o texto claro contem padroes especificos
            if b'Facebook' in plaintext or b'Instagram' in plaintext or b'Twitter' in plaintext:
                return plaintext
            else:
                print(f"Texto claro obtido com a chave {key} nao contem os padroes esperados")  # Adicionando depuracao
        except Exception as e:
            print(f"Erro ao tentar chave {key}: {e}")  # Adicionando depuracao
            pass
    return None

with open("senhas.rc4", "rb") as f:
    ciphertext = f.read()
print(f"Texto cifrado: {ciphertext}")  # Depuracao do texto cifrado lido

# Definir seu espaco de chaves para tentar (ajuste conforme sua pesquisa)
key_space = [
    b"123456", b"admin", b"12345678", b"123456789", b"1234", b"12345", b"password", b"minhachavesegura",
    b"123", b"Aa123456", b"1234567890", b"senh@123", b"abc123senha", b"123qwe", b"senhaforte", b"123abc!",
    b"senha12345", b"qwerty123", b"senh@abc", b"123senha456", b"senha123!", b"user", b"senhaforte",
    b"Password", b"00000000", b"123123", b"P@sw0rd", b"1111111", b"Brasil", b"senha", b"senhas",
    b"101010", b"9876543210", b"familia", b"estrela", b"dinheiro", b"sucesso"
]  # Certifique-se de que a chave 'minhachavesegura' esta nesta lista

plaintext = rc4_decrypt_bruteforce(ciphertext, key_space)

if plaintext:
    with open("senhas.txt", "wb") as f:
        f.write(plaintext)
    print("Arquivo decriptado com sucesso!")
else:
    print("Chave nao encontrada.")
