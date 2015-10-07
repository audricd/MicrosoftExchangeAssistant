Write-Output "Welcome to the Microsoft Exchange Assistant v0.0.3. This tool is to make diagnostics easier.
This uses remote powershell connection, so if you do not have it set up, this tool will not work.`n
http://github.com/audricd/MicrosoftExchangeAssistant `n"


Try
 {
$server = Read-Host -Prompt 'Please input your Exchange server address, in this format "exchange.domain.com"'
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "http://$server/PowerShell" -ErrorAction SilentlyContinue
Import-PSSession $ExchangeSession -ErrorAction SilentlyContinue
Write-Output "`n$server is selected for this session `n"
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