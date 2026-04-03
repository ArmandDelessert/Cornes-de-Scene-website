# publish.ps1 - Publie une nouvelle version du site ACAIF
# Squash merge de dev dans main, push (déclenche Netlify), puis resynchronise dev.

$ErrorActionPreference = "Stop"  # Arrêt immédiat en cas d'erreur

function Invoke-Git {
    Write-Host "git $args" -ForegroundColor DarkGray
    git @args
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

# ── Vérifications préalables ───────────────────────────────────────────────────

$branche = git branch --show-current
if ($branche -ne "dev") {
    Write-Host "❌ Erreur : Ce script doit être lancé depuis la branche 'dev'." -ForegroundColor Red
    exit 1
}

git diff-index --quiet HEAD --
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur : Il y a des modifications non commitées sur 'dev'." -ForegroundColor Red
    Write-Host "   Validez ou remisez vos changements avant de publier."
    exit 1
}

# ── Publication de la nouvelle version ────────────────────────────────────────

$version = "Version $(Get-Date -Format 'yyyy-MM-dd-HH-mm')"
Write-Host ""
Write-Host "📦 Publication : $version" -ForegroundColor Cyan
Write-Host ""

Invoke-Git push origin dev

Invoke-Git checkout main
Invoke-Git merge --squash dev

$squashMsgPath = Join-Path (git rev-parse --git-dir) "SQUASH_MSG"
$squashMsg = if (Test-Path $squashMsgPath) { Get-Content $squashMsgPath -Raw } else { "" }
"$version`n`n$squashMsg" | Set-Content $squashMsgPath -NoNewline -Encoding UTF8
Invoke-Git commit -F $squashMsgPath
Invoke-Git push origin main
Write-Host "🚀 Déploiement déclenché sur Netlify." -ForegroundColor Green

Invoke-Git checkout dev
Invoke-Git merge main --no-edit
Invoke-Git push origin dev

Write-Host ""
Write-Host "✅ Publication terminée : $version" -ForegroundColor Green
Write-Host ""
