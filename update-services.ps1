# PowerShell script to update all service files for Gilmer, TX

$servicePath = "c:\Users\USER\Desktop\gilmer\services\"

# Get all HTML files in services directory
$serviceFiles = Get-ChildItem -Path $servicePath -Filter "*.html"

foreach ($file in $serviceFiles) {
    Write-Host "Processing service file: $($file.Name)"
    
    # Read file content
    $content = Get-Content $file.FullName -Raw
    
    # Replace location references
    $content = $content -replace "Huntertown, IN", "Gilmer, TX"
    $content = $content -replace "Huntertown IN", "Gilmer TX"
    $content = $content -replace "Huntertown", "Gilmer"
    $content = $content -replace "huntertown", "gilmer"
    $content = $content -replace "Fort Wayne", "East Texas"
    $content = $content -replace "Indiana", "Texas"
    $content = $content -replace "northeastern Indiana", "East Texas"
    $content = $content -replace "Allen County", "Upshur County"
    
    # Replace zip codes
    $content = $content -replace "46748", "75644"
    $content = $content -replace "46845", "75645"
    
    # Replace state abbreviations
    $content = $content -replace '(?<!")IN(?!")', "TX"
    $content = $content -replace '"IN"', '"TX"'
    
    # Replace coordinates
    $content = $content -replace "41\.1306", "32.7287"
    $content = $content -replace "-85\.1394", "-94.9433"
    $content = $content -replace "41\.2228", "32.7287"
    $content = $content -replace "-85\.1694", "-94.9433"
    
    # Replace addresses
    $content = $content -replace "12845 Coldwater Road", "1245 West Marshall Avenue"
    $content = $content -replace "15920 Lima Road", "1245 West Marshall Avenue"
    
    # Climate-specific replacements
    $content = $content -replace "cold weather", "hot Texas summers"
    $content = $content -replace "freezing temperatures", "extreme heat"
    $content = $content -replace "sub-zero conditions", "intense summer heat"
    $content = $content -replace "frigid winter months", "hot summer months"
    $content = $content -replace "continental climate", "subtropical climate"
    $content = $content -replace "varied climate", "East Texas climate"
    
    # Write updated content back to file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8
}

Write-Host "All service files updated successfully!"
