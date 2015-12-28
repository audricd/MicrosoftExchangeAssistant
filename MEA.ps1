$date = Get-Date -format dd.MM.yyy-HH.mm

If(-not(Test-Path -Path logs))
 {
     Write-Output "Creating logs folder"
	 New-Item -Path logs -Type Directory -Force | Out-Null
  }
Start-Transcript -Path logs\log$date.txt  | Out-Null

Write-Output "`nWelcome to the Microsoft Exchange Assistant v0.1.4 This tool is to make diagnostics easier. For Services management, use services.ps1
This uses remote powershell connection, so if you do not have it set up, this tool will not work.`n
http://github.com/audricd/MicrosoftExchangeAssistant `n"


#2013
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


#2010 SP3
if ($version="Version 14.3 (Build 266.2)"){$versiontext = "SP3 UR11"}
if ($version="Version 14.3 (Build 248.2)"){$versiontext = "SP3 UR10"}
if ($version="Version 14.3 (Build 235.1)"){$versiontext = "SP3 UR9"}
if ($version="Version 14.3 (Build 224.2)"){$versiontext = "SP3 UR8v2"}
if ($version="Version 14.3 (Build 224.1)"){$versiontext = "SP3 UR8v1"}
if ($version="Version 14.3 (Build 210.2)"){$versiontext = "SP3 UR7"}
if ($version="Version 14.3 (Build 195.1)"){$versiontext = "SP3 UR6"}
if ($version="Version 14.3 (Build 181.6)"){$versiontext = "SP3 UR5"}
if ($version="Version 14.3 (Build 174.1)"){$versiontext = "SP3 UR4"}
if ($version="Version 14.3 (Build 169.1)"){$versiontext = "SP3 UR3"}
if ($version="Version 14.3 (Build 158.1)"){$versiontext = "SP3 UR2"}
if ($version="Version 14.3 (Build 146.0)"){$versiontext = "SP3 UR1"}
if ($version="Version 14.3 (Build 123.4)"){$versiontext = "SP3"}


#2010 SP2
if ($version="Version 14.2 (Build 390.3)"){$versiontext = "SP2 UR8"}
if ($version="Version 14.2 (Build 375.0)"){$versiontext = "SP2 UR7"}
if ($version="Version 14.2 (Build 342.3)"){$versiontext = "SP2 UR6"}
if ($version="Version 14.2 (Build 328.10)"){$versiontext = "SP2 UR5v2"}
if ($version="Version 14.2 (Build 328.5)"){$versiontext = "SP2 UR5v1"}
if ($version="Version 14.2 (Build 318.4)"){$versiontext = "SP2 UR4v2"}
if ($version="Version 14.2 (Build 318.2)"){$versiontext = "SP2 UR4v1"}
if ($version="Version 14.2 (Build 309.2)"){$versiontext = "SP2 UR3"}
if ($version="Version 14.2 (Build 298.4)"){$versiontext = "SP2 UR2"}
if ($version="Version 14.2 (Build 283.3)"){$versiontext = "SP2 UR1"}
if ($version="Version 14.2 (Build 247.5)"){$versiontext = "SP2"}


#2010 SP1
if ($version="Version 14.1 (Build 438.0)"){$versiontext = "SP1 UR8"}
if ($version="Version 14.1 (Build 421.3)"){$versiontext = "SP1 UR7v3"}
if ($version="Version 14.1 (Build 421.2)"){$versiontext = "SP1 UR7v2"}
if ($version="Version 14.1 (Build 421.0)"){$versiontext = "SP1 UR7v1"}
if ($version="Version 14.1 (Build 355.2)"){$versiontext = "SP1 UR6"}
if ($version="Version 14.1 (Build 339.1)"){$versiontext = "SP1 UR5"}
if ($version="Version 14.1 (Build 323.6)"){$versiontext = "SP1 UR4"}
if ($version="Version 14.1 (Build 289.7)"){$versiontext = "SP1 UR3"}
if ($version="Version 14.1 (Build 270.1)"){$versiontext = "SP1 UR1"}
if ($version="Version 14.1 (Build 255.2)"){$versiontext = "SP1 UR1"}
if ($version="Version 14.1 (Build 247.5)"){$versiontext = "SP1"}


#2010 RTM
if ($version="Version 14.0 (Build 726.0)"){$versiontext = "RTM UR5"}
if ($version="Version 14.0 (Build 702.1)"){$versiontext = "RTM UR4"}
if ($version="Version 14.0 (Build 694.0)"){$versiontext = "RTM UR3"}
if ($version="Version 14.0 (Build 689.0)"){$versiontext = "RTM UR1"}
if ($version="Version 14.0 (Build 682.1)"){$versiontext = "SP1 UR1"}
if ($version="Version 14.0 (Build 639.21)"){$versiontext = "RTM"}


#2007 SP3
if ($version="Version 8.3 (Build 417.1)"){$versiontext = "SP3 UR17"}
if ($version="Version 8.3 (Build 406.0)"){$versiontext = "SP3 UR16"}
if ($version="Version 8.3 (Build 389.2)"){$versiontext = "SP3 UR15"}
if ($version="Version 8.3 (Build 379.2)"){$versiontext = "SP3 UR14"}
if ($version="Version 8.3 (Build 348.2)"){$versiontext = "SP3 UR13"}
if ($version="Version 8.3 (Build 342.4)"){$versiontext = "SP3 UR12"}
if ($version="Version 8.3 (Build 327.1)"){$versiontext = "SP3 UR11"}
if ($version="Version 8.3 (Build 298.3)"){$versiontext = "SP3 UR10"}
if ($version="Version 8.3 (Build 297.2)"){$versiontext = "SP3 UR9"}
if ($version="Version 8.3 (Build 279.6)"){$versiontext = "SP3 UR8v3"}
if ($version="Version 8.3 (Build 279.5)"){$versiontext = "SP3 UR8v2"}
if ($version="Version 8.3 (Build 279.3)"){$versiontext = "SP3 UR8"}
if ($version="Version 8.3 (Build 264.0)"){$versiontext = "SP3 UR7"}
if ($version="Version 8.3 (Build 245.2)"){$versiontext = "SP3 UR6"}
if ($version="Version 8.3 (Build 213.1)"){$versiontext = "SP3 UR5"}
if ($version="Version 8.3 (Build 192.1)"){$versiontext = "SP3 UR4"}
if ($version="Version 8.3 (Build 159.2)"){$versiontext = "SP3 UR3"}
if ($version="Version 8.3 (Build 137.3)"){$versiontext = "SP3 UR2"}
if ($version="Version 8.3 (Build 106.2)"){$versiontext = "SP3 UR1"}
if ($version="Version 8.3 (Build 83.6)"){$versiontext = "SP3"}


#2007 SP2
if ($version="Version 8.2 (Build 305.3)"){$versiontext = "SP2 UR5"}
if ($version="Version 8.2 (Build 254.0)"){$versiontext = "SP2 UR4"}
if ($version="Version 8.2 (Build 247.2)"){$versiontext = "SP2 UR3"}
if ($version="Version 8.2 (Build 234.1)"){$versiontext = "SP3 UR2"}
if ($version="Version 8.2 (Build 217.3)"){$versiontext = "SP3 UR1"}
if ($version="Version 8.2 (Build 176.2)"){$versiontext = "SP2"}


#2007 SP1
if ($version="Version 8.1 (Build 436.0)"){$versiontext = "SP1 UR10"}
if ($version="Version 8.1 (Build 393.1)"){$versiontext = "SP1 UR9"}
if ($version="Version 8.1 (Build 375.2)"){$versiontext = "SP1 UR8"}
if ($version="Version 8.1 (Build 359.2)"){$versiontext = "SP1 UR7"}
if ($version="Version 8.1 (Build 340.1)"){$versiontext = "SP1 UR6"}
if ($version="Version 8.1 (Build 336.1)"){$versiontext = "SP1 UR5"}
if ($version="Version 8.1 (Build 311.3)"){$versiontext = "SP1 UR4"}
if ($version="Version 8.1 (Build 291.2)"){$versiontext = "SP1 UR3"}
if ($version="Version 8.1 (Build 278.2)"){$versiontext = "SP1 UR2"}
if ($version="Version 8.1 (Build 263.1)"){$versiontext = "SP1 UR1"}
if ($version="Version 8.1 (Build 240.6)"){$versiontext = "SP1"}


#2007 RTM
if ($version="Version 8.0 (Build 813.0)"){$versiontext = "RTM UR7"}
if ($version="Version 8.0 (Build 783.2)"){$versiontext = "RTM UR6"}
if ($version="Version 8.0 (Build 754.0)"){$versiontext = "RTM UR5"}
if ($version="Version 8.0 (Build 744.0)"){$versiontext = "RTM UR4"}
if ($version="Version 8.0 (Build 730.1)"){$versiontext = "RTM UR3"}
if ($version="Version 8.0 (Build 711.2)"){$versiontext = "RTM UR2"}
if ($version="Version 8.0 (Build 708.3)"){$versiontext = "RTM UR1"}
if ($version="Version 8.0 (Build 685.25)"){$versiontext = "RTM"}





Try
 {
$server = Read-Host -Prompt 'Please input your Exchange server address, in this format "exchange.domain.com"'
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "http://$server/PowerShell" -ErrorAction SilentlyContinue
Import-PSSession $ExchangeSession -ErrorAction SilentlyContinue  | Out-Null
$version = (Get-ExchangeServer | fw -Property AdminDisplayVersion | Out-String).trim()
Write-Output "`n$server (running $version, $versiontext)is selected for this session `n"

}
Catch [system.exception]
 { "error found, most likely invalid address. please restart the application."

	  }
Finally
 {


do {
  [int]$userMenuChoice = 0
  while ( $userMenuChoice -lt 1 -or $userMenuChoice -gt 5) {
	Write-Host "1. View server info"
	Write-Host "2. View all mailboxes"
	Write-Host "3. View all databases"
	Write-Host "4. View statistics of a specific Mailbox (must know the name)"
    Write-Host "5. Exit"

    [int]$userMenuChoice = Read-Host "`nPlease choose an option"

    switch ($userMenuChoice) {
	  1{Get-ExchangeServer | ft -wrap -autosize; Get-Exchangeserver | fl > "logs\$date-$server-serverinfo.txt"; Write-Output "$date-$server-serverinfo.txt has been generated with all the details `n"; }
	  2{Get-Mailbox * | ft -wrap -autosize; Get-Mailbox * | fl > "logs\$date-$server-mailboxes.txt"; Write-Output "$date-$server-mailboxes.txt has been generated with all the details `n" }
	  3{Get-MailboxDatabase | ft -wrap -autosize; Get-MailboxDatabase * | fl > "logs\$date-$server-mailboxesdatabases.txt"; Write-Output "$date-$server-mailboxesdatabases.txt has been generated with all the details`n" }
	  4{$mailboxstats = Read-Host -Prompt "Which Mailbox do you want to check statistics?"; Get-MailboxStatistics $mailboxstats | ft -Wrap -AutoSize; Get-MailboxStatistics $mailboxstats | fl > "logs\$date-$server-$mailboxstats-mailboxstatistics.txt"; Write-Output "$date-$server-$mailboxstats-mailboxstatistics.txt has been generated with all the details`n" }

}
}
	}

 while	 ( $userMenuChoice -ne 5 )
	}
Stop-Transcript