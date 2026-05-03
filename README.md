# Site web des Cornes de Scène

Site officiel des **Cornes de Scène**, troupe de théâtre amateur de Forel (Lavaux).

Ce site est réalisé avec **[Hugo](https://gohugo.io/)** (générateur de site statique) et hébergé sur **[Netlify](https://www.netlify.com/)**.

| **Branche** | **Statut du déploiement** |
| ----------- | ------------------------- |
| [`main`](https://github.com/ArmandDelessert/Cornes-de-Scene-website/tree/main) | [![Netlify Status (`main` branch)](https://api.netlify.com/api/v1/badges/d408ed50-857d-4229-9cf4-ebdf64c134c2/deploy-status)](https://app.netlify.com/projects/cornes-de-scene/deploys) |
| [`dev`](https://github.com/ArmandDelessert/Cornes-de-Scene-website/tree/dev) | [![Netlify Status (`dev` branch)](https://api.netlify.com/api/v1/badges/d408ed50-857d-4229-9cf4-ebdf64c134c2/deploy-status?branch=dev)](https://app.netlify.com/projects/cornes-de-scene/deploys) |

## Accès au site

- Site officiel : [www.cornes-de-scene.ch](https://www.cornes-de-scene.ch/)
- Préversion : [dev.cornes-de-scene.ch](https://dev.cornes-de-scene.ch/)
- Lien Netlify : [cornes-de-scene.netlify.app](https://cornes-de-scene.netlify.app/)

## Technologies utilisées

- [Hugo](https://gohugo.io/) (**version extended requise**)
- [Go](https://go.dev/) (requis pour Hugo Modules)
- Thème [Ananke](https://github.com/gohugo-ananke/ananke) (via Hugo Modules)
- Markdown pour le contenu
- [Netlify](https://www.netlify.com/) pour le déploiement automatique

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
