# Downloads the photos and badges from the old WordPress site into \images.
# Run once from the repo root while the old site is still online:
#   powershell -ExecutionPolicy Bypass -File scripts\fetch-images.ps1
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")
New-Item -ItemType Directory -Force -Path images | Out-Null
$base = "https://rosie-ilieva-counselling.co.uk/wp-content/uploads"
$files = @{
  "2024/07/rosie.jpg"         = "rosie.jpg"
  "2024/07/path.jpg"          = "path.jpg"
  "2024/07/tree.jpg"          = "tree.jpg"
  "2024/07/waves-scaled.jpg"  = "waves.jpg"
  "2024/07/registered_id.png" = "registered_id.png"
  "2024/07/PCA.png"           = "PCA.png"
}
foreach ($src in $files.Keys) {
  $dest = Join-Path "images" $files[$src]
  Write-Host "-> $dest"
  Invoke-WebRequest -Uri "$base/$src" -OutFile $dest
}
Write-Host "Done."
