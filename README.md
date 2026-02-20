# Portfolio — Darryl Nou'ou Faumen

Portfolio professionnel présentant mes compétences en Data, BI, IA et développement web.

## Consulter en ligne

➡️ **https://faumen-darryl.github.io/portfolio/**

## Publier sur GitHub (première fois)

### Méthode 1 : Avec GitHub CLI (recommandé)

Si vous avez [Git](https://git-scm.com) et [GitHub CLI](https://cli.github.com) installés :

1. Ouvrez un terminal dans le dossier `portfolio`
2. Exécutez : `.\deploy-github.ps1`

### Méthode 2 : Manuellement

1. **Créer le dépôt sur GitHub**
   - Allez sur https://github.com/new
   - Nom : `portfolio`
   - Public ✓
   - Ne cochez pas "Add a README"
   - Cliquez sur **Create repository**

2. **Dans le dossier portfolio, ouvrez un terminal** et exécutez :

```bash
git init
git add .
git commit -m "Portfolio initial"
git branch -M main
git remote add origin https://github.com/Faumen-darryl/portfolio.git
git push -u origin main
```

3. **Activer GitHub Pages**
   - Repo → **Settings** → **Pages**
   - Source : **Deploy from a branch**
   - Branch : **gh-pages** / **(root)**
   - Save — le workflow créera automatiquement la branche au prochain push

## Lancer en local

Double-cliquez sur `index.html` ou :

```bash
npx serve .
```

## Structure

```
portfolio/
├── index.html
├── styles.css
├── script.js
├── .gitignore
├── deploy-github.ps1
└── .github/workflows/pages.yml
```
