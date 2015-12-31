$date = Get-Date -format dd.MM.yyy-HH.mm

If(-not(Test-Path -Path logs))
 {
     Write-Output "Creating logs folder"
	 New-Item -Path serviceslogs -Type Directory -Force | Out-Null
  }
Start-Transcript -Path serviceslogs\log$date.txt  | Out-Null

Write-Output "`nWelcome to the Microsoft Exchange Services Assistant v0.3 This tool is to make Exchange Services management easier.
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
#InternetInformationServicesAdmin
$IISAdmin = "IISAdmin"
#World Wide Web Publishing Services
$W3SVC = "W3Svc"
#Windows Remote Management
$WinRM = "WinRM"
#Roles
$AllRoles = ($ADTopology, $IISAdmin, $IS, $MBAs, $Rep, $RPC, $ServiceHost, $Throttling, $W3SVC, $WinRM, $MBRep, $W3SVC, $UM, $EdgeSync, $Transport)
$MailboxServerRole = ($IISAdmin, $ADTopology, $IS, $MBAs, $Rep, $RPC, $ServiceHost, $Throttling, $W3SVC, $WinRM)
$ClientAccessRole = ($IISAdmin, $ADTopology, $MBRep, $RPC, $ServiceHost, $W3SVC, $WinRM)
$UnifiedMessagingRole = ($IISAdmin, $ADTopology, $ServiceHost, $UM, $W3SVC, $WinRM)
$HubTransportRole = ($IISAdmin, $ADTopology, $EdgeSync, $ServiceHost, $Transport, $W3SVC, $WinRM)
#Check for down services
$SServicesAllRoles = Get-Service $AllRoles | Where-Object {$_.Status -eq "Stopped"}
$SSMailboxServerRole = Get-Service $MailboxServerRole | Where-Object {$_.Status -eq "Stopped"}
$SSClientAccessRole = Get-Service $ClientAccessRole | Where-Object {$_.Status -eq "Stopped"}
$SSUnifiedMessagingRole = Get-Service $UnifiedMessagingRole | Where-Object {$_.Status -eq "Stopped"}
$SSHubTransportRole = Get-Service $HubTransportRole | Where-Object {$_.Status -eq "Stopped"}

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
FMS

Non Exchange Server services but still required:
IISAdmin
W3Svc
WinRM
"
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
  while ( $userMenuChoice -lt 1 -or $userMenuChoice -gt 12) {
	Write-Host "1. Check the status of a single service"
	Write-Host "2. Check if the services required for All roles servers are running"
	Write-Host "3. Check if the services required for MailBox role are running"
	Write-Host "4. Check if the services required for Client Access role are running"
	Write-Host "5. Check if the services required for Unified Messaging role are running"
	Write-Host "6. Check if the services required for Hub Transport role are running"
	Write-Host "7. See stopped services required for All roles"
	Write-Host "8. See stopped services required for MailBox role"
	Write-Host "9. See stopped services required for Client Access role"
	Write-Host "10. See stopped services required for Unified Messaging role"
	Write-Host "11. See stopped services required for Hub Transport role"
    Write-Host "12. Exit"

    [int]$userMenuChoice = Read-Host "`nPlease choose an option"

    switch ($userMenuChoice) {
	  1{$checkservice = Read-Host -Prompt "Which service to check the status?"; $status = Get-Service $checkservice ; Write-Host $checkservice is $status.Status `n}
	  2{Get-Service $AllRoles}
	  3{Get-Service $MailboxServerRole}
	  4{Get-Service $ClientAccessRole}
	  5{Get-Service $UnifiedMessagingRole}
	  6{Get-Service $HubTransportRole}
	  7{If($SServicesAllRoles.Count -eq 0){Write-Host "All services for all role are running `n"} else {$SServicesAllRoles}}
	  8{If($SSMailboxServerRole.Count -eq 0){Write-Host "All services for MailBox role are running `n"} else {$SSMailboxServerRole}}
	  9{If($SSClientAccessRole.Count -eq 0){Write-Host "All services for Client Access role are running `n"} else {$SSClientAccessRole}}
	  10{If($SSUnifiedMessagingRole.Count -eq 0){Write-Host "All services for Unified Messaging role are running `n"} else {$SSUnifiedMessagingRole}}
	  11{If($SSHubTransportRole.Count -eq 0){Write-Host "All services for Hub Transport role are running `n"} else {$SSHubTransportRole}}
	}
}
	}

 while	 ( $userMenuChoice -ne 12 )
	}
Stop-Transcript