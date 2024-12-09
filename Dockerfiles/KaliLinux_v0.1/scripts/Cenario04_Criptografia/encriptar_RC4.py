from cryptography.hazmat.primitives.ciphers import Cipher
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.ciphers.algorithms import ARC4

def encrypt_file(input_file, output_file, key):
    if not (1 <= len(key) <= 256):
        raise ValueError("A chave deve ter entre 1 e 256 bytes")

    with open(input_file, 'rb') as f:
        plaintext = f.read()

    algorithm = ARC4(key)
    cipher = Cipher(algorithm, mode=None, backend=default_backend())
    encryptor = cipher.encryptor()
    ciphertext = encryptor.update(plaintext) + encryptor.finalize()

    with open(output_file, 'wb') as f:
        f.write(ciphertext)

key = b'minhachavesegura'
input_file = 'senhas.txt'
output_file = 'senhas.rc4'
encrypt_file(input_file, output_file, key)
print(f"Arquivo '{input_file}' foi encriptado e salvo como '{output_file}'")
