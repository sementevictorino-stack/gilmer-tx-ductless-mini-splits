# PowerShell script to fix over-replacements in location files

$locationPath = "c:\Users\USER\Desktop\gilmer\locations\"
$locationFiles = Get-ChildItem -Path $locationPath -Filter "*.html"

foreach ($file in $locationFiles) {
    Write-Host "Fixing: $($file.Name)"
    
    $content = Get-Content $file.FullName -Raw
    
    # Fix over-replacements
    $content = $content -replace "mTXi", "mini"
    $content = $content -replace "TXstall", "install"
    $content = $content -replace "TXitial", "initial"
    $content = $content -replace "sizTXg", "sizing"
    $content = $content -replace "busTXess", "business"
    $content = $content -replace "poTXt", "point"
    $content = $content -replace "coordTXates", "coordinates"
    $content = $content -replace "maaTXenance", "maintenance"
    $content = $content -replace "traaTXg", "training"
    $content = $content -replace "wTXdow", "window"
    $content = $content -replace "lTXk", "link"
    $content = $content -replace "LocalBusTXess", "LocalBusiness"
    $content = $content -replace "GeoCoordTXates", "GeoCoordinates"
    $content = $content -replace "geoMidpoTXt", "geoMidpoint"
    $content = $content -replace "busTXesses", "businesses"
    $content = $content -replace "begTXnTXg", "beginning"
    $content = $content -replace "maTXtaTXTXg", "maintaining"
    $content = $content -replace "TXcludes", "includes"
    $content = $content -replace "TXspection", "inspection"
    $content = $content -replace "TXsulation", "insulation"
    $content = $content -replace "TXdoor", "indoor"
    $content = $content -replace "paTXt", "paint"
    $content = $content -replace "maTXtenance", "maintenance"
    $content = $content -replace "aTXmation", "animation"
    $content = $content -replace "orTXinal", "original"
    $content = $content -replace "termlTXal", "terminal"
    $content = $content -replace "TXerTXal", "internal"
    $content = $content -replace "TXternal", "internal"
    
    # Write fixed content back to file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8
}

Write-Host "Fixed over-replacements in all location files!"
