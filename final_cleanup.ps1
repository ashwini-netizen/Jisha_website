$files = @("index.html", "about.html", "services.html", "appointment.html", "contact.html")

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        
        # Comprehensive cleanup of all animation artifacts
        $content = $content -replace ' reveal reveal-up delay-\d', ""
        $content = $content -replace ' reveal reveal-up', ""
        $content = $content -replace ' delay-\d', ""
        $content = $content -replace ' animate-fade', ""
        $content = $content -replace ' animate-slide', ""
        $content = $content -replace ' reveal', ""
        $content = $content -replace ' active', "" # Be careful, but in our context active was mostly for reveal
        
        # Fix any damaged tags
        $content = $content -replace '(?s)<div class="">(.*?)</div>', '$1'
        
        Set-Content $f $content -NoNewline
        Write-Host "Cleaned up artifacts from: $f"
    }
}
