@echo off
chcp 65001 >nul
echo === Deploiement du portfolio sur GitHub ===
echo.

where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Erreur: Git n'est pas installe. Installez-le depuis https://git-scm.com
    pause
    exit /b 1
)

if not exist ".git" (
    echo Initialisation du depot Git...
    git init
)

echo Ajout des fichiers...
git add .

echo Creation du commit...
git commit -m "Portfolio initial - Darryl Nou'ou Faumen"

echo.
where gh >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo Creation du depot sur GitHub...
    gh repo create portfolio --public --source=. --remote=origin --push
    if %ERRORLEVEL% equ 0 (
        echo.
        echo Succes! Activez GitHub Pages: Repo ^> Settings ^> Pages ^> Source: GitHub Actions
        echo Votre portfolio sera sur: https://faumen-darryl.github.io/portfolio/
    )
) else (
    echo.
    echo GitHub CLI non installe. Etapes manuelles:
    echo 1. Allez sur https://github.com/new
    echo 2. Nom: portfolio, Public, sans README
    echo 3. Creer, puis dans le terminal:
    echo    git remote add origin https://github.com/Faumen-darryl/portfolio.git
    echo    git branch -M main
    echo    git push -u origin main
    echo 4. Repo ^> Settings ^> Pages ^> GitHub Actions
)

echo.
pause
