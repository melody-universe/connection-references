Remove-Item ./dev.zip -ErrorAction Ignore

pac solution export `
    -p dev.zip `
    -n Core2 `
    -m `
    -a

Remove-Item ./solution -Recurse -Force -ErrorAction Ignore
Remove-Item ./canvas -Recurse -Force -ErrorAction Ignore

pac solution unpack `
    --zipfile dev.zip `
    --folder solution `
    --packagetype Managed

pac canvas unpack `
    --sources canvas `
    --msapp .\solution\CanvasApps\new_sql2_cfdd8_DocumentUri.msapp
