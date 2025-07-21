function Sync-SupabaseSchema {
    Write-Host "🧩 Syncing Supabase schema..."
    Push-Location "$PSScriptRoot\..\..\supabase_schema"
    supabase db push
    Pop-Location
}