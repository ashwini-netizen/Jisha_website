$headerTop = '    <!-- Header Top -->
    <div class="header-top">
        <div class="container">
            <div class="header-contact">
                <a href="tel:+919876543210" style="color: inherit;"><span><i class="fas fa-phone-alt"></i> +91 98765 43210</span></a>
                <a href="mailto:info@jishaprime.com" style="color: inherit;"><span><i class="fas fa-envelope"></i> info@jishaprime.com</span></a>
            </div>
            <div class="header-time">
                <span><i class="fas fa-clock"></i> Mon - Sat: 9:00 AM - 8:00 PM</span>
            </div>
        </div>
    </div>'

$files = @("index.html", "about.html", "services.html", "appointment.html", "contact.html")
foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        $content = $content -replace '(?s)<!-- Header Top -->.*?<!-- Main Navigation -->', ($headerTop + "`n`n    <!-- Main Navigation -->")
        Set-Content $f $content -NoNewline
        Write-Host "Updated header in: $f"
    }
}
