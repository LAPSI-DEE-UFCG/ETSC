#!/bin/bash

for ip in $(cat ip_list.txt); do
  echo "Verificando IP: $ip"
  nc -zv $ip 20-1234
done
