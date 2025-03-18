# TESTE
#!/bin/bash

echo "[+] Detectando IP da máquina..."
IP=$(hostname -I | awk '{print $1}')
echo "Seu IP: $IP"
echo "Preparando para servir arquivos na porta 8080..."

read -p "Digite o caminho completo da pasta onde está o payload: " folder
cd "$folder" || { echo "[-] Pasta não encontrada!"; exit 1; }

if command -v python3 >/dev/null 2>&1; then
  echo "[+] Usando Python3 HTTP Server"
  python3 -m http.server 8080
elif command -v python >/dev/null 2>&1; then
  echo "[+] Python3 não encontrado, tentando Python2"
  python -m SimpleHTTPServer 8080
elif command -v busybox >/dev/null 2>&1; then
  echo "[+] Python não encontrado, usando busybox httpd"
  busybox httpd -f -p 8080 -h "$folder"
  echo "Servidor rodando em http://$IP:8080 (Ctrl+C para parar)"
  sleep infinity
else
  echo "[-] Nenhuma ferramenta disponível (python3, python2 ou busybox não encontrados). Instale uma delas."
fi
