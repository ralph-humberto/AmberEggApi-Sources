$resourceGroupName=$args[0]
$resourceApiManagementName=$args[1]    
$apiName=$args[2] #the name of the web API.
$url=$args[3] #the URL of the web service that exposes the API.
$path="/" #the web API path, which is the last part of the API's public URL and corresponds to the Web API URL suffix field in the admin portal.

$ApiMgmtContext =New-AzureRmApiManagementContext -ResourceGroupName $resourceGroupName -ServiceName $resourceApiManagementName

#create api
$api = New-AzureRmApiManagementApi -Context $ApiMgmtContext -Name $apiName -ServiceUrl $url -Protocols @("http", "https") -Path $path

#run the command if you do not know product id
Get-AzureRmApiManagementProduct -Context $ApiMgmtContext

#add api to product
Add-AzApiManagementApiToProduct -Context $ApiMgmtContext -ProductId "" -ApiId $api.ApiId