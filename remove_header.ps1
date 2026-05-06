$files = @("index.html", "about.html", "services.html", "appointment.html", "contact.html")
foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        $content = $content -replace '(?s)<!-- Header Top -->.*?</div>\s+</div>', ""
        Set-Content $f $content -NoNewline
        Write-Host "Removed header-top from: $f"
    }
}
