param(
    [Parameter(Mandatory=$true)]
    [string]$zipFilePath
)

Remove-Item ./solution -Recurse -Force -ErrorAction Ignore
Remove-Item ./canvas -Recurse -Force -ErrorAction Ignore

pac solution unpack `
    --zipfile $zipFilePath `
    --folder solution `
    --packagetype Managed

pac canvas unpack `
    --sources canvas `
    --msapp .\solution\CanvasApps\new_sql2_cfdd8_DocumentUri.msapp
