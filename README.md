# Les Cornes de Scène – Site web

Site officiel des **Cornes de Scène**, troupe de théâtre amateur de Forel (Lavaux).

Ce site est réalisé avec **[Hugo](https://gohugo.io/)** (générateur de site statique) et hébergé sur **[Netlify](https://www.netlify.com/)**.

## Prérequis

- **Hugo extended**
- **Go**
- **Git**

## Lancer le site en local

```bash
hugo server
```

Puis ouvrir `http://localhost:1313` dans le navigateur.

## Structure du projet

```text
CornesDeScène-website/
├── content/
│   ├── events/          # Pièces de théâtre
│   ├── galleries/       # Galeries photos
│   ├── _index.md        # Page d'accueil
│   └── credits.md       # Page Crédits
├── custom-headers/      # Headers HTTP par contexte de déploiement
├── layouts/
│   ├── _default/        # Page d'accueil personnalisée
│   ├── events/          # Templates pour les pièces de théâtre
│   └── partials/        # Surcharges du thème (dark mode, favicon, footer)
├── static/
│   └── CdS-logo/       # Logos de la troupe
├── config.toml          # Configuration principale du site
├── netlify.toml         # Configuration Netlify (build, headers)
└── README.md
```

## Déploiement

Le site est automatiquement déployé via Netlify à chaque `push` sur Git.
