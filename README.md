Stop or Start all WebApps in your Resource groups (New AzureRM)
===============================================================

            

Pre-Requisites for Azure Automation 






1.The CredentialAssetUser should be a Co-Administrator([How to Add a Co-Administrator](https://docs.microsoft.com/en-us/azure/billing/billing-add-change-azure-subscription-administrator))


2. Import the required Modules ([How to import the modules in Azure automation](https://docs.microsoft.com/en-us/azure/automation/automation-update-azure-modules)) 


e.g, AzureRM.profile , AzureRM.Websites


 


Parameter for the Script 


The Script required 3 required parameters:


 


**Stop:**


True** =>**Stop all the APP Services for that particular Resource Group if it's already running


False**=>**Start all the APP Services for that particular Resource Group if it's already Stopped


 


**CredentialAssetName**:


  The name of a working Credential Asset (AutomationPSCredential)


*(P.S: 1st Pre-Requisites)*


 


**Resource Group Name:**


The name of the resource group where the APP Services resides.


 


 

 
 

 


        
    
TechNet gallery is retiring! This script was migrated from TechNet script center to GitHub by Microsoft Azure Automation product group. All the Script Center fields like Rating, RatingCount and DownloadCount have been carried over to Github as-is for the migrated scripts only. Note : The Script Center fields will not be applicable for the new repositories created in Github & hence those fields will not show up for new Github repositories.
