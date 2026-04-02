
Key Vault:

# Create Resource Group 
New-AzResourceGroup -Name "rg-clinical" -Location "eastus"

# Create Key Vault
New-AzKeyVault -Name "kv-clinical" -ResourceGroupName "rg-clinical" -Location "eastus"

# Add the VM admin password as a secret
$securePass = ConvertTo-SecureString "Harryp2250!!" -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName "kv-clinical" -Name "VMAdminPassword" -SecretValue $securePass
