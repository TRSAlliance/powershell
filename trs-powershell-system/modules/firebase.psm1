function Start-FirebaseBuild {
    Write-Host "⚡ Building Firebase Functions & Hosting..."
    Push-Location "$PSScriptRoot\..\..\src"
    npm install
    firebase deploy --only functions,hosting
    Pop-Location
}