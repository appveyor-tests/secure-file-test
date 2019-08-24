(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/appveyor/secure-file/master/install.ps1')
iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/appveyor/secure-file/master/install.ps1'))
cmd /c appveyor-tools\secure-file -decrypt my-secret.txt.enc -secret $env:my_secret
$originalValue = (Get-Content my-secret.txt)
if($originalValue -ne 'Hello, world!') { throw "Decrypted string is not equal to the original one!"; }
