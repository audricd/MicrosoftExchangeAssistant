$date = Get-Date -format dd.MM.yyy-HH.mm

If(-not(Test-Path -Path logs))
 {
     Write-Output "Creating logs folder"
	 New-Item -Path serviceslogs -Type Directory -Force | Out-Null
  }
Start-Transcript -Path serviceslogs\log$date.txt  | Out-Null

Write-Output "`nWelcome to the Microsoft Exchange Services Assistant v0.1 This tool is to make Exchange Services management easier.
This uses remote powershell connection, so if you do not have it set up, this tool will not work.`n
http://github.com/audricd/MicrosoftExchangeAssistant `n"

#Services
#Active Directory Topology
$ADTopology = "MSExchangeADTopology"
#Anti-Spam Update
$AntispamUpdate = "MSExchangeAntispamUpdate"
#DAG Management
$DagMngt = "MSExchangeDagMgmt"
#Diagnostics
$Diags = "MSExchangeDiagnostics"
#EdgeSync
$EdgeSync = "MSExchangeEdgeSync"
#Frontend transport
$FETransport = "MSExchangeFrontEndTransport"
#Health Manager
$HM = "MSExchangeHM"
#IMAP4
$Imap4 = "MSExchangeImap4"
#IMAP4 Backend
$Imap4BE = "MSExchangeIMAP4BE"
#Information Store
$IS = "MSExchangeIS"
#Mailbox Assistants
$MBAs = "MSExchangeMailboxAssistants"
#Mailbox Replication
$MBRep = "MSExchangeMailboxReplication"
#Mailbox Transport Delivery
$Delivery = "MSExchangeDelivery"
#Mailbox Transport Submission
$MBSub = "MSExchangeSubmission"
#Migration Workflow
$MigWorkflow = "MSExchangeMigrationWorkflow"
#POP3
$Pop3 = "MSExchangePop3"
#POP3 Backend
$Pop3BE = "MSExchangePOP3BE"
#Replication
$Rep = "MSExchangeRepl"
#RPC Client Access
$RPC = "MSExchangeRPC"
#Search
$FS = "MSExchangeFastSearch"
#Search Host Controller
$SearchHostCtrl = "HostControllerService"
#Server Extension for Windows Server Backup
$ExtWinBackUp = "wsbexchange"
#Service Host
$ServiceHost = "MSExchangeServiceHost"
#Throttling
$Throttling = "MSExchangeThrottling"
#Transport Service
$Transport = "MSExchangeTransport"
#Transport Log Search
$TransportLS = "MSExchangeTransportLogSearch"
#Unified Messaging
$UM = "MSExchangeUM"
#Unified Messaging Call Router
$UMCR = "MSExchangeUMCR"
#Filtering Management Service
$FMS = "FMS"

Write-Output "These are the Exchange Services:
MSExchangeADTopology
MSExchangeAntispamUpdate
MSExchangeDagMgmt
MSExchangeDiagnostics
MSExchangeEdgeSync
MSExchangeFrontEndTransport
MSExchangeHM
MSExchangeImap4
MSExchangeIMAP4BE
MSExchangeIS
MSExchangeMailboxAssistants
MSExchangeMailboxReplication
MSExchangeDelivery
MSExchangeSubmission
MSExchangeMigrationWorkflow
MSExchangePop3
MSExchangePOP3BE
MSExchangeRepl
MSExchangeRPC
MSExchangeFastSearch
HostControllerService
wsbexchange
MSExchangeServiceHost
MSExchangeThrottling
MSExchangeTransport
MSExchangeTransportLogSearch
MSExchangeUM
MSExchangeUMCR
FMS"
Try {
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
  while ( $userMenuChoice -lt 1 -or $userMenuChoice -gt 2) {
	Write-Host "1. Check the status of a single service"
    Write-Host "2. Exit"

    [int]$userMenuChoice = Read-Host "`nPlease choose an option"

    switch ($userMenuChoice) {
	  1{$checkservice = Read-Host -Prompt "Which service to check the status?"; $status = Get-Service $checkservice ; Write-Host $checkservice is $status.Status `n}
}
}
	}

 while	 ( $userMenuChoice -ne 2 )
	}
Stop-Transcript