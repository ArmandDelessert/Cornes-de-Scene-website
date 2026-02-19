# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Hugo static site for ACAIF (Association des Commerçants, Artisans et Industriels de Forel), deployed on Netlify. The site is in French (fr-CH) and serves as the official website for this Swiss business association.

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
- `content/members/` - Member profiles with company information, contact details
- `content/events/` - Events with dates, locations, and descriptions

### Custom Layouts
- `layouts/_default/home.html` - Homepage with upcoming events preview
- `layouts/members/list.html` - Displays all members as cards with full details (no individual pages)
- `layouts/members/single.html` - Redirects to /members/
- `layouts/events/list.html` - Displays events split into "À venir" and "Événements passés" sections
- `layouts/events/single.html` - Redirects to /events/

### Static Files
- `static/ACAIF-logo/` - Association logo
- `static/banners/` - Banner images for pages
- `static/events/` - Event resources (images, PDFs)
- `static/members/logos/` - Company logos for members

### Hugo Configuration
- Base URL: `https://acaif.ch/`
- Language: French (Switzerland) - `fr-CH`
- Theme: Ananke v2 (`github.com/theNewDynamic/gohugo-theme-ananke/v2`)
- `buildFuture = true` - Shows upcoming events
- Custom permalinks for members (`/members/:slug/`) and events (`/events/:slug/`)
- Hugo Modules enabled for theme management

### Deployment
- Netlify deployment with `public` as publish directory
- Build command: `hugo --gc --minify`
- Hugo version: 0.151
- Go version: 1.25
- Production environment variable: `HUGO_ENV = "production"`
- GitHub Actions workflow for daily scheduled rebuild (updates past/upcoming events)

## Content Management

### Members
Fields: title (company name), representative (contact person), role, address, phone, email, website, featured_image, description (content body)

All member information is displayed on the `/members/` list page. Individual member pages redirect to the list.

### Events
Fields: title, date, location, description (content body)

Events are automatically sorted:
- **Upcoming events**: from nearest to farthest date
- **Past events**: from most recent to oldest

The separation between past and upcoming events is determined at build time. A daily rebuild via GitHub Actions ensures events are correctly categorized.
