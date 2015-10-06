Write-Output "Welcome to the Microsoft Exchange Assistant v0.0.1. This tool is to make diagnostics easier.
This uses remote powershell connection, so if you do not have it set up, this tool will not work.`n
http://github.com/audricd/MicrosoftExchangeAssistant `n"
$server = Read-Host -Prompt 'Please input your Exchange server address, in this format "exchange.domain.com"'
Try
{
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "http://$server/PowerShell" -ErrorAction SilentlyContinue
Import-PSSession $ExchangeSession
Write-Output "`n$server is selected for this session"
	}
	Catch
{
    Write-Output "wrong server name. Try again";
	}
	finally{
do {
  [int]$userMenuChoice = 0
  while ( $userMenuChoice -lt 1 -or $userMenuChoice -gt 2) { 
	Write-Host "1. Get server information"
	Write-Host "2. Close and exit"

    [int]$userMenuChoice = Read-Host "Please choose an option"
    switch ($userMenuChoice) {
	  1{Get-Exchangeserver} 
}
}
	}
while	 ( $userMenuChoice -ne 2 )
	
		}