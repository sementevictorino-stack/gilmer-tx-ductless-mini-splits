# PowerShell script to update all location files for Gilmer, TX

# Define Texas cities to replace the Indiana cities
$texasCities = @{
    "albion" = "longview"
    "angola" = "marshall" 
    "auburn" = "tyler"
    "avilla" = "carthage"
    "butler" = "kilgore"
    "churubusco" = "henderson"
    "columbia-city" = "gladewater"
    "fort-wayne" = "dallas"
    "fremont" = "paris"
    "garrett" = "texarkana"
    "grabill" = "jefferson"
    "kendallville" = "hallsville"
    "ligonier" = "ore-city"
    "monroeville" = "big-sandy"
    "new-haven" = "white-oak"
    "roanoke" = "tatum"
    "rome-city" = "beckville"
    "waterloo" = "easton"
    "woodburn" = "elysian-fields"
}

$locationPath = "c:\Users\USER\Desktop\gilmer\locations\"

# Process each file
foreach ($oldCity in $texasCities.Keys) {
    $newCity = $texasCities[$oldCity]
    $oldFile = "$locationPath$oldCity-ductless-mini-splits.html"
    $newFile = "$locationPath$newCity-ductless-mini-splits.html"
    
    if (Test-Path $oldFile) {
        Write-Host "Processing $oldCity -> $newCity"
        
        # Read file content
        $content = Get-Content $oldFile -Raw
        
        # Replace city names and locations
        $content = $content -replace "Huntertown", "Gilmer"
        $content = $content -replace "huntertown", "gilmer" 
        $content = $content -replace "IN", "TX"
        $content = $content -replace "Indiana", "Texas"
        $content = $content -replace "northeastern Indiana", "East Texas"
        $content = $content -replace "Fort Wayne", "East Texas"
        $content = $content -replace "Allen County", "Upshur County"
        $content = $content -replace "46748", "75644"
        $content = $content -replace "46845", "75645"
        
        # Geographic coordinates for Gilmer, TX
        $content = $content -replace "41\.2228", "32.7287"
        $content = $content -replace "-85\.1694", "-94.9433"
        
        # Write to new file
        $content | Out-File -FilePath $newFile -Encoding UTF8
        
        # Remove old file
        Remove-Item $oldFile -Force
    }
}

Write-Host "Location files updated successfully!"
