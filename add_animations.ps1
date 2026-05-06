$files = @("index.html", "about.html", "services.html", "appointment.html", "contact.html")

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        
        # Add reveal to sections
        $content = $content -replace '(<section class="section)', '$1 reveal reveal-up'
        
        # Add reveal to cards (staggered)
        # Use a loop to add staggered delays manually for the first 4 cards found
        $content = $content -replace '(<div class="feature-card)', '$1 reveal reveal-up delay-1'
        $content = $content -replace '(<div class="service-card)', '$1 reveal reveal-up delay-2'
        $content = $content -replace '(<div class="contact-card)', '$1 reveal reveal-up delay-1'
        $content = $content -replace '(<div class="premium-field)', '$1 reveal reveal-up delay-1'
        
        # Special case for hero
        $content = $content -replace '(<section class="hero)', '$1 animate-fade'
        $content = $content -replace '(<h1>.*?</h1>)', '<div class="animate-slide">$1</div>'
        
        Set-Content $f $content -NoNewline
        Write-Host "Added animations to: $f"
    }
}
