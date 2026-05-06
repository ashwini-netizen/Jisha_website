$logoImg = "                <!-- Original Logo Image -->`n                <img src=""assets/logo.png"" alt=""Jisha Prime Orthopaedic & Spine Care Logo"" style=""height: 70px; width: auto;"">"

$files = @("about.html","services.html","appointment.html","contact.html")
foreach ($f in $files) {
    $content = Get-Content $f -Raw
    $content = $content -replace '(?s)<!-- Master Built-in Original Logo \(High-Fidelity\) -->.*?</svg>', $logoImg
    Set-Content $f $content -NoNewline
    Write-Host "Fixed: $f"
}
