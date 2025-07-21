param (
    [Parameter(Position = 0)]
    [ValidateSet("firebase", "netlify", "supabase", "ai", "fix", "all")]
    [string]$target = "all"
)

Import-Module "$PSScriptRoot\modules\firebase.psm1" -Force
Import-Module "$PSScriptRoot\modules\netlify.psm1" -Force
Import-Module "$PSScriptRoot\modules\supabase.psm1" -Force
Import-Module "$PSScriptRoot\modules\ai.psm1" -Force

switch ($target) {
    "firebase" { Start-FirebaseBuild }
    "netlify"  { Deploy-Netlify }
    "supabase" { Sync-SupabaseSchema }
    "ai"       { Run-AIWorker }
    "fix"      { Fix-Project }
    "all"      {
        Start-FirebaseBuild
        Deploy-Netlify
        Sync-SupabaseSchema
        Run-AIWorker
    }
}