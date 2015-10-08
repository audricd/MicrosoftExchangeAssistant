Write-Output "Welcome to the Microsoft Exchange Assistant v0.0.4. This tool is to make diagnostics easier.
This uses remote powershell connection, so if you do not have it set up, this tool will not work.`n
http://github.com/audricd/MicrosoftExchangeAssistant `n"

if ($version="Version 15.0 (Build 1130.7)"){$versiontext = "CU10"}
if ($version="Version 15.0 (Build 1104.5)"){$versiontext = "CU9"}
if ($version="Version 15.0 (Build 1076.9)"){$versiontext = "CU8"}
if ($version="Version 15.0 (Build 1044.25)"){$versiontext = "CU7"}
if ($version="Version 15.0 (Build 995.29)"){$versiontext = "CU6"}
if ($version="Version 15.0 (Build 913.22)"){$versiontext = "CU5"}
if ($version="Version 15.0 (Build 847.32)"){$versiontext = "SP1"}
if ($version="Version 15.0 (Build 775.38)"){$versiontext = "CU3"}
if ($version="Version 15.0 (Build 712.24)"){$versiontext = "CU2"}
if ($version="Version 15.0 (Build 620.29)"){$versiontext = "CU1"}
if ($version="Version 15.0 (Build 516.32)"){$versiontext = "RTM"}



Try
 {
$server = Read-Host -Prompt 'Please input your Exchange server address, in this format "exchange.domain.com"'
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "http://$server/PowerShell" -ErrorAction SilentlyContinue
Import-PSSession $ExchangeSession -ErrorAction SilentlyContinue
$version = (Get-ExchangeServer | fw -Property AdminDisplayVersion | Out-String).trim()
Write-Output "`n$server (running $version, $versiontext)is selected for this session `n"

}
Catch [system.exception]
 { "error found, most likely invalid address. please restart the application."
	  }
Finally
 {
$date = Get-Date -format dd.MM.yyy-HH.mm

do {
  [int]$userMenuChoice = 0
  while ( $userMenuChoice -lt 1 -or $userMenuChoice -gt 4) {
	Write-Host "1. Print server info"
	Write-Host "2. Print all mailboxes"
	Write-Host "3. Print all databases"
    Write-Host "4. Exit"

    [int]$userMenuChoice = Read-Host "`nPlease choose an option"

    switch ($userMenuChoice) {
	  1{Get-Exchangeserver | fl > "$date-$server-serverinfo.txt"; Write-Output "$date-$server-serverinfo.txt has been generated `n"}
	  2{Get-Mailbox * | fl > "$date-$server-mailboxes.txt"; Write-Output "$date-$server-mailboxes.txt has been generated `n" }
	  3{Get-MailboxDatabase * | fl > "$date-$server-mailboxesdatabases.txt"; Write-Output "$date-$server-mailboxesdatabases.txt has been generated `n" }
}
}
	}

 while	 ( $userMenuChoice -ne 4 )
	}