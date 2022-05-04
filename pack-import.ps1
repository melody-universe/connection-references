param(
    [string]$packageType
)
if(-not $packageType) {
    $packageType = "Managed"
}
<#
$contents = Get-Content ./canvas/Connections/Connections.json
Set-Content `
    ./canvas/Connections/Connections.json `
    ($contents -Replace `
        "/providers/microsoft.powerapps/apis/shared_sql/connections/[^`"]*",
        "/providers/microsoft.powerapps/apis/shared_sql/connections/eccad584f275403aa4c05702870e7d7b"
    )

$contents = Get-Content ./solution/CanvasApps/new_sql2_cfdd8.meta.xml
Set-Content ./solution/CanvasApps/new_sql2_cfdd8.meta.xml `
    ($contents -Replace `
        '"sharedConnectionId":"[^"]*"',
        '"sharedConnectionId":"ab873d20-080a-4a97-b472-a9ba1898d18c"'
    )
#>

pac canvas pack `
    --sources canvas `
    --msapp .\solution\CanvasApps\new_sql2_cfdd8_DocumentUri.msapp

pac solution pack `
    --zipfile dev.zip `
    --folder solution `
    --packagetype $packageType

pac solution import `
    --path dev.zip `
    --activate-plugins `
    --convert-to-managed `
    --async
