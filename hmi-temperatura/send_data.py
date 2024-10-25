import socket
import random
import time

def enviar_dados_falsos():
    host = input("Digite o IP do Windows 7: ")
    port = 65432

    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((host, port))

            while True:
                temperatura = f"{random.uniform(30.0, 40.0):.2f}"
                s.sendall(temperatura.encode())  
                print(f"Dados Enviados: {temperatura}")
                time.sleep(1)  

    except Exception as e:
        print(f"Erro ao enviar dados falsos: {e}")

if __name__ == "__main__":
    enviar_dados_falsos()
