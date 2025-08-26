# PowerShell script to update navigation in all location files

$locationPath = "c:\Users\USER\Desktop\gilmer\locations\"
$locationFiles = Get-ChildItem -Path $locationPath -Filter "*.html"

# Define the new navigation HTML for Texas cities
$newNavigation = @'
                        <div class="dropdown-content">
                            <a href="gilmer-ductless-mini-splits.html">Gilmer</a>
                            <a href="longview-ductless-mini-splits.html">Longview</a>
                            <a href="marshall-ductless-mini-splits.html">Marshall</a>
                            <a href="tyler-ductless-mini-splits.html">Tyler</a>
                            <a href="carthage-ductless-mini-splits.html">Carthage</a>
                            <a href="kilgore-ductless-mini-splits.html">Kilgore</a>
                            <a href="henderson-ductless-mini-splits.html">Henderson</a>
                            <a href="gladewater-ductless-mini-splits.html">Gladewater</a>
                            <a href="dallas-ductless-mini-splits.html">Dallas</a>
                            <a href="paris-ductless-mini-splits.html">Paris</a>
                            <a href="texarkana-ductless-mini-splits.html">Texarkana</a>
                            <a href="jefferson-ductless-mini-splits.html">Jefferson</a>
                            <a href="hallsville-ductless-mini-splits.html">Hallsville</a>
                            <a href="ore-city-ductless-mini-splits.html">Ore City</a>
                            <a href="big-sandy-ductless-mini-splits.html">Big Sandy</a>
                            <a href="white-oak-ductless-mini-splits.html">White Oak</a>
                            <a href="tatum-ductless-mini-splits.html">Tatum</a>
                            <a href="beckville-ductless-mini-splits.html">Beckville</a>
                            <a href="easton-ductless-mini-splits.html">Easton</a>
                            <a href="elysian-fields-ductless-mini-splits.html">Elysian Fields</a>
                        </div>
'@

foreach ($file in $locationFiles) {
    Write-Host "Updating navigation in: $($file.Name)"
    
    $content = Get-Content $file.FullName -Raw
    
    # Replace the old dropdown content with new Texas cities
    $content = $content -replace '(?s)<div class="dropdown-content">.*?<a href="monroeville-ductless-mini-splits.html">Monroeville</a>\s*</div>', $newNavigation
    
    # Write updated content back to file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8
}

Write-Host "Navigation updated in all location files!"
