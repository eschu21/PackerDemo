## Simple Script to Install AWS CodeDeploy Agent

New-Item -Path c:\temp -ItemType "directory" -Force
Read-S3Object -BucketName aws-codedeploy-us-east-1/latest -Key codedeploy-agent.msi -File c:\temp\codedeploy-agent.msi
Start-Process -Wait -FilePath c:\temp\codedeploy-agent.msi -WindowStyle Hidden

Get-Service | Where-Object {$_.displayname -eq "CodeDeploy"}
Get-Service | Where-Object {$_.status -eq "running"}
Stop-Service codedeployagent
Set-Service codedeployagent -startuptype "manual"
