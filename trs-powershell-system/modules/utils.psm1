function Fix-Project {
    Write-Host "🔍 Scanning project for common issues..."

    if (-Not (Test-Path "node_modules")) {
        Write-Host "Installing dependencies..."
        npm install
    }

    if (Test-Path "firebase.json") {
        Write-Host "Firebase config detected. Checking deploy..."
        Start-FirebaseBuild
    }

    if (Test-Path "netlify.toml") {
        Write-Host "Netlify config found. Redeploying..."
        Deploy-Netlify
    }

    Write-Host "✅ Project scan complete."
}