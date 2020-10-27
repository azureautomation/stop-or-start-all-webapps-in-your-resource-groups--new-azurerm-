Workflow START_STOP_APP_SERVICE_BY_RESOURCE
{
	# Parameters
	Param(
		[Parameter (Mandatory= $true)]
	    [bool]$Stop,
		
		[Parameter (Mandatory= $true)]
		[string]$CredentialAssetName,

       [Parameter (Mandatory= $true)]
		[string]$ResourcegroupName
	   )  
	   
	#The name of the Automation Credential Asset this runbook will use to authenticate to Azure.
    $CredentialAssetName = $CredentialAssetName;
	
	#Get the credential with the above name from the Automation Asset store
    $Cred = Get-AutomationPSCredential -Name $CredentialAssetName
    if(!$Cred) {
        Throw "Could not find an Automation Credential Asset named '${CredentialAssetName}'. Make sure you have created one in this Automation Account."
    }

  

    #Connect to your Azure Account   	
	Add-AzureRmAccount -Credential $Cred
	       
	
		$status = 'Stopped'
		if ($Stop)
		{
			$status = 'Running'
		}

		# Get Running WebApps (website_Processings_Running)
		$website_Processings_Running = Get-AzureRMWebAPP -ResourceGroupName $ResourcegroupName | where-object -FilterScript{$_.state -eq $status }
		
		foreach -parallel ($website_Processing In $website_Processings_Running)
		{
			if ($Stop)
			{
				$result = Stop-AzureRmWebApp -ResourceGroupName $ResourcegroupName -Name $website_Processing.Name
				if($result)
				{
					Write-Output "- $($website_Processing.Name) shutdown successfully"
				}
				else
				{
					Write-Output "+ $($website_Processing.Name) did not shutdown successfully"
				}
			}
			else
			{
				$result = Start-AzureRmWebApp -ResourceGroupName $ResourcegroupName -Name $website_Processing.Name
				if($result)
				{
					Write-Output "- $($website_Processing.Name) start successfully"
				}
				else
				{
					Write-Output "+ $($website_Processing.Name) did not started successfully"
				}
			} 
		}
	}	