# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Hugo static site for Les Cornes de Scène, a theatre troupe from Forel (Lavaux), Switzerland. The site is in French (fr-CH) and serves as the official website for this amateur theatre group. Deployed on Netlify.

## Development Commands

### Build Commands
- `hugo` - Build the site using Hugo
- `hugo --gc --minify` - Build with garbage collection and minification (production build)
- `hugo server` - Start development server with live reload

### Dependencies
- Hugo v0.151+ (required for building)
- Go v1.25+ (required for Hugo modules)
- The project uses Hugo Modules to manage the Ananke theme dependency

## Architecture

### Content Structure
- `content/_index.md` - Homepage with troupe presentation, plays overview, and member list
- `content/events/` - Plays (pièces de théâtre) with dates, locations, cast, and descriptions
- `content/galleries/` - Photo galleries (placeholder for now)
- `content/credits.md` - Site credits

### Custom Layouts
- `layouts/_default/home.html` - Homepage with content and link to plays
- `layouts/events/list.html` - Displays all plays as cards (sorted by year, most recent first)
- `layouts/events/single.html` - Individual play page with full details (representations, cast, etc.)

### Static Files
- `static/CdS-logo/` - Troupe logos (square and round versions)
- `static/_redirects` - Netlify redirect rules

### Hugo Configuration
- Base URL: `https://cornes-de-scene.ch/`
- Language: French (Switzerland) - `fr-CH`
- Theme: Ananke v2 (`github.com/gohugo-ananke/ananke/v2`)
- `buildFuture = true` - Shows future plays
- Hugo Modules enabled for theme management

### Deployment
- Netlify deployment with `public` as publish directory
- Build command: `hugo --gc --minify`
- Hugo version: 0.151
- Go version: 1.25
- Production environment variable: `HUGO_ENV = "production"`
- Dev branch builds add noindex headers

## Content Management

### Plays (pièces de théâtre)
Front matter fields: title, date, author, director
Content body: description, representations (dates/locations), cast (distribution), optional images/flyers

Plays are displayed sorted from most recent to oldest.

### Troupe Info
The homepage contains the troupe's presentation, list of plays performed, and member list. Members are listed with first names only (some with nicknames).
