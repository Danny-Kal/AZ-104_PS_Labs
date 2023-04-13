#Check Graph is installed
Get-InstalledModule Microsoft.Graph

#Check permissions needed for Graph cmdlet
Find-MgGraphCommand -command Get-MgUser | Select -First 1 -ExpandProperty Permissions

#Authenticate to Graph API
$tenantid = "2e2d8b2f-2d7f-4c12-9bb7-90152233ddc5"
Connect-MgGraph –TenantId $tenantid -Scopes "User.Read.All", "Group.ReadWrite.All"

#Find userID of user
Get-MgUser
$userId = f074369b-e7ef-4ff3-86c4-b12dc26c7044

#Retrieve usage location of user
get-mguser -userid $userId -property usagelocation | Select-Object usagelocation

#Update usage location of user
update-mguser -userid $userId -usagelocation gb

#Assign password to secure variable and create user
$PasswordProfile = @{
  Password = 'xWwvJ]6NMw+bWH-d'
  }
New-MgUser -DisplayName 'az104-01a-aaduser1' -PasswordProfile $PasswordProfile -AccountEnabled -MailNickName 'az104-01a-aaduser1' -UserPrincipalName 'az104-01a-aaduser1@contoso.com'

#Find the ID for the user
Get-MgUser

#List the Azure AD roles of the user
$uri = "https://graph.microsoft.com/beta/roleManagement/directory/transitiveRoleAssignments?`$count=true&`$filter=principalId eq 'xxxxx-xxxxx-xxxxx-xxxxx-xxxxx'"
$method = 'GET'
$headers = @{'ConsistencyLevel' = 'eventual'}
(Invoke-MgGraphRequest -Uri $uri -Headers $headers -Method $method -Body $null).value

