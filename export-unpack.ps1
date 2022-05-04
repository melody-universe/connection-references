Remove-Item ./dev.zip -ErrorAction Ignore
Remove-Item ./dev_managed.zip -ErrorAction Ignore

pac solution export `
    --path dev.zip `
    --name Core2 `
    --async

pac solution export `
    --path dev_managed.zip `
    --name Core2 `
    --managed `
    --async

Remove-Item ./solution -Recurse -Force -ErrorAction Ignore
Remove-Item ./canvas -Recurse -Force -ErrorAction Ignore

pac solution unpack `
    --zipfile dev.zip `
    --folder solution `
    --packagetype Both

pac canvas unpack `
    --sources canvas `
    --msapp .\solution\CanvasApps\new_sql2_cfdd8_DocumentUri.msapp
