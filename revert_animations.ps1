$files = @("index.html", "about.html", "services.html", "appointment.html", "contact.html")

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        
        # Remove animation classes and wrappers
        $content = $content -replace ' reveal reveal-up', ""
        $content = $content -replace ' reveal reveal-up delay-1', ""
        $content = $content -replace ' reveal reveal-up delay-2', ""
        $content = $content -replace ' animate-fade', ""
        $content = $content -replace '(?s)<div class="animate-slide">(.*?)</div>', '$1'
        
        Set-Content $f $content -NoNewline
        Write-Host "Removed animations from: $f"
    }
}

# Revert CSS
$cssPath = "css/style.css"
if (Test-Path $cssPath) {
    $css = Get-Content $cssPath -Raw
    $css = $css -replace '(?s)/\* Professional Animation System \*/.*$', ""
    Set-Content $cssPath $css -NoNewline
    Write-Host "Reverted CSS"
}

# Revert JS
$jsPath = "js/main.js"
if (Test-Path $jsPath) {
    $js = Get-Content $jsPath -Raw
    $js = $js -replace '(?s)// Professional Scroll Reveal Animation.*?}\);', "});"
    Set-Content $jsPath $js -NoNewline
    Write-Host "Reverted JS"
}
