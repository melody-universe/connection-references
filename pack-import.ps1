$json = Get-Content ./canvas/Connections/Connections.json | ConvertFrom-Json
$sharedConnId = Write-Host $json."764ffc66-bf59-47d6-980a-31daaa4c94e1".connectionRef.sharedConnectionId
$json."764ffc66-bf59-47d6-980a-31daaa4c94e1".connectionRef.sharedConnectionId = `
    "/providers/microsoft.powerapps/apis/shared_sql/connections/eccad584f275403aa4c05702870e7d7b"
Set-Content ./canvas/Connections/Connections.json (ConvertTo-Json $json)

exit

pac canvas pack `
    --sources canvas `
    --msapp .\solution\CanvasApps\new_sql2_cfdd8_DocumentUri.msapp

pac solution pack `
    --zipfile dev.zip `
    --folder solution `
    --packagetype Managed

pac solution import `
    --path dev.zip `
    --activate-plugins `
    --async
