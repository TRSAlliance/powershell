function Deploy-Netlify {
    Write-Host "🌐 Checking Netlify deploy..."
    Push-Location "$PSScriptRoot\..\..\src"
    if (-Not (Test-Path "node_modules")) {
        npm install
    }
    netlify deploy --prod
    Pop-Location
}