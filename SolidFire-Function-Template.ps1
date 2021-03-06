<# This provides an example template of how PowerShell can be used to make calls against the SolidFire API 
for methods not already available in the SolidFire Tools for PowerShell module.
Leverage Postman collections http://www.github.com/solidfire/postman to identify method requirements.
Expects that you have an active connection to a SolidFire cluster using the published module's Connect-SFCluster cmdlet.
#>
Function SolidFireTemplate{
<#
.Synopsis
	
 	 Performs XXXXX on SolidFire Cluster  
	 
	.Description 
	 Performs XXXXX on SolidFire Cluster
	 
	.Parameter A
	
	 Parameter Description
	
	.Parameter B
	 
	 Parameter Description
	 
	.Example
	
	 Get-Example
	 
	.Example
	 
	 Get-Example
	 
	.Link
	 http://www.solidfire.com
	 
	.Notes
	
	====================================================================
	Disclaimer: This script is written as best effort and provides no 
	warranty expressed or implied. Please contact the author(s) if you 
	have questions about this script before running or modifying
	====================================================================
#>
[CmdletBinding(ConfirmImpact="Medium")]
param(
    [Parameter()]
    [String]$OptionA,
    [Parameter()]
    [String]$OptionB
)
# Extracts credentials from $sfconnection global variable
$creds = New-Object System.Management.Automation.PSCredential ($sfconnection.NetworkCredential.UserName, $sfconnection.NetworkCredential.SecurePassword)


if($SFConnection.Target -eq $null){
	# Checks to ensure the connection information has been collected using Connect-SFCluster
	Write-Host "You do not have an active SolidFire Cluster connection." -ForegroundColor Yellow
	Break
} else {
# Enter script execution here
	# Providing an example API call.
    $method = 'ListActiveVolumes'
	$body = @{method="$method";params={}} | ConvertTo-Json -Compress
	$activevolumes = Invoke-RestMethod -Uri $SFConnection.UriAppliance -Credential $creds -Method Post -Body $body -ContentType $SFCluster.ContentType
	
    # The JSON-RPC return result needs to be parsed
    $result = $activevolumes.result.volumes
	
# Add variable specific adjustments	
}
	Return $finalresult




# Runs Once
BEGIN {

}

# Runs one time for every object piped in
PROCESS {}

# Runs once
END {}

}