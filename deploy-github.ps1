# Script pour publier le portfolio sur GitHub
# Double-cliquez ou exécutez depuis le dossier portfolio : .\deploy-github.ps1

$ErrorActionPreference = "Stop"

Write-Host "=== Deploiement du portfolio sur GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Vérifier Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Erreur: Git n'est pas installe. Installez-le depuis https://git-scm.com" -ForegroundColor Red
    exit 1
}

# Initialiser Git si necessaire
if (-not (Test-Path ".git")) {
    Write-Host "Initialisation du depot Git..." -ForegroundColor Yellow
    git init
}

# Ajouter les fichiers
Write-Host "Ajout des fichiers..." -ForegroundColor Yellow
git add .

# Commit
Write-Host "Creation du commit..." -ForegroundColor Yellow
git commit -m "Portfolio initial - Darryl Nou'ou Faumen" 2>$null
if ($LASTEXITCODE -ne 0) {
    # Peut echouer si rien a commiter
    git status
}

# Verifier gh (GitHub CLI)
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host ""
    Write-Host "Creation du depot sur GitHub..." -ForegroundColor Yellow
    $repoName = "portfolio"
    $repo = gh repo create $repoName --public --source=. --remote=origin --push 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "Succes!" -ForegroundColor Green
        $username = (gh api user -q .login)
        Write-Host "Portfolio publie: https://github.com/$username/$repoName" -ForegroundColor Green
        Write-Host "Pages (apres activation): https://$username.github.io/$repoName/" -ForegroundColor Green
        Write-Host ""
        Write-Host "Activez GitHub Pages: Repo > Settings > Pages > Source: Deploy from branch > main" -ForegroundColor Cyan
    } else {
        Write-Host $repo -ForegroundColor Red
        Write-Host "Si le depot existe deja, ajoutez le remote et poussez manuellement." -ForegroundColor Yellow
    }
} else {
    Write-Host ""
    Write-Host "GitHub CLI (gh) non installe." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Etapes manuelles:" -ForegroundColor Cyan
    Write-Host "1. Allez sur https://github.com/new" -ForegroundColor White
    Write-Host "2. Nom du repo: portfolio" -ForegroundColor White
    Write-Host "3. Public, sans README" -ForegroundColor White
    Write-Host "4. Creer le depot" -ForegroundColor White
    Write-Host "5. Puis executez:" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/Faumen-darryl/portfolio.git" -ForegroundColor Gray
    Write-Host "   git branch -M main" -ForegroundColor Gray
    Write-Host "   git push -u origin main" -ForegroundColor Gray
    Write-Host ""
    Write-Host "6. Settings > Pages > Deploy from branch > main > Save" -ForegroundColor White
    Write-Host "7. Votre portfolio sera sur: https://faumen-darryl.github.io/portfolio/" -ForegroundColor Green
}
