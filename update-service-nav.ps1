# PowerShell script to update navigation in all service files

$servicePath = "c:\Users\USER\Desktop\gilmer\services\"
$serviceFiles = Get-ChildItem -Path $servicePath -Filter "*.html"

# Define the new navigation HTML for Texas cities
$newNavigation = @'
                        <div class="dropdown-content">
                            <a href="../locations/gilmer-ductless-mini-splits.html">Gilmer</a>
                            <a href="../locations/longview-ductless-mini-splits.html">Longview</a>
                            <a href="../locations/marshall-ductless-mini-splits.html">Marshall</a>
                            <a href="../locations/tyler-ductless-mini-splits.html">Tyler</a>
                            <a href="../locations/carthage-ductless-mini-splits.html">Carthage</a>
                            <a href="../locations/kilgore-ductless-mini-splits.html">Kilgore</a>
                            <a href="../locations/henderson-ductless-mini-splits.html">Henderson</a>
                            <a href="../locations/gladewater-ductless-mini-splits.html">Gladewater</a>
                            <a href="../locations/dallas-ductless-mini-splits.html">Dallas</a>
                            <a href="../locations/paris-ductless-mini-splits.html">Paris</a>
                            <a href="../locations/texarkana-ductless-mini-splits.html">Texarkana</a>
                            <a href="../locations/jefferson-ductless-mini-splits.html">Jefferson</a>
                            <a href="../locations/hallsville-ductless-mini-splits.html">Hallsville</a>
                            <a href="../locations/ore-city-ductless-mini-splits.html">Ore City</a>
                            <a href="../locations/big-sandy-ductless-mini-splits.html">Big Sandy</a>
                            <a href="../locations/white-oak-ductless-mini-splits.html">White Oak</a>
                            <a href="../locations/tatum-ductless-mini-splits.html">Tatum</a>
                            <a href="../locations/beckville-ductless-mini-splits.html">Beckville</a>
                            <a href="../locations/easton-ductless-mini-splits.html">Easton</a>
                            <a href="../locations/elysian-fields-ductless-mini-splits.html">Elysian Fields</a>
                        </div>
'@

foreach ($file in $serviceFiles) {
    Write-Host "Updating navigation in: $($file.Name)"
    
    $content = Get-Content $file.FullName -Raw
    
    # Replace the old dropdown content with new Texas cities
    $content = $content -replace '(?s)<div class="dropdown-content">.*?<a href="../locations/monroeville-ductless-mini-splits.html">Monroeville</a>\s*</div>', $newNavigation
    
    # Write updated content back to file
    $content | Out-File -FilePath $file.FullName -Encoding UTF8
}

Write-Host "Navigation updated in all service files!"
