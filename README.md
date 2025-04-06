# Vinyl Records Website

A sophisticated 3-page static website for a premium vinyl records shop, built using HTML5, CSS3, XML, DTD, and XSLT. This project showcases modern web design principles, including glassmorphism, and relies on client-side XML transformation, eliminating the need for JavaScript.

## Project Overview

Vinyl Records is a modern, visually appealing website designed for a high-end vinyl record store located in Dubai. It features:

-   **Home Page (`main.html`)**: Landing page introducing the store, showcasing its exclusive location, private shopping hours, curated collections, and upcoming events.
-   **Catalog Page (`catalog.html`)**: A browseable catalog of featured vinyl records with placeholders for potential future filtering and pagination.
-   **Vinyl Library (`program.xml` styled by `style.xsl`)**: A comprehensive inventory of vinyl records stored in XML format, rendered dynamically in the browser using XSLT. Includes library statistics and a sortable table.

The design employs a dark theme with gold and orange accents, utilizing glassmorphism effects for a premium feel. A cohesive navigation header and footer are present on all pages, along with a rotating vinyl record animation for added visual flair.

## Project Structure

```
/
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions workflow for deployment
├── scripts/
│   └── server.py         # Python server for local development
├── catalog.html            # Static HTML page for the record catalog
├── data.dtd                # DTD for validating program.xml
├── main.html               # Main homepage (entry point for local development)
├── program.xml             # XML data for the vinyl library
├── style.xsl               # XSLT stylesheet for transforming program.xml
├── styles.css              # Main CSS stylesheet for all pages
├── README.md               # This file
├── .gitignore              # Specifies intentionally untracked files
├── package.json            # Node.js package metadata (primarily for gh-pages dev dependency)
└── package-lock.json       # Records exact versions of Node.js dependencies
```

## Features

-   **Multi-Page Structure**: Intuitive navigation between Home, Catalog, and the Vinyl Library.
-   **Premium Design**: Dark theme, glassmorphism, gold/orange accents, responsive layout.
-   **Pure XML/XSLT Rendering**: The Vinyl Library page (`program.xml`) is rendered directly in the browser using the linked `style.xsl` stylesheet. No server-side transformation or JavaScript is required for this page.
-   **Client-Side Transformation**: Leverages browser capabilities to transform and display XML data.
-   **DTD Validation**: Ensures the integrity and structure of the `program.xml` data.
-   **CSS Animations**: Includes a rotating vinyl record animation.
-   **GitHub Actions Deployment**: Automated deployment to GitHub Pages on pushes to the `main` branch.
-   **Local Development Server**: A simple Python server (`scripts/server.py`) is provided to correctly handle MIME types for local testing, especially for XML/XSLT/DTD rendering.

## Viewing the Website

### Local Development

1.  **Start the Server**: Open a terminal in the project's root directory and run: `python scripts/server.py`
2.  **Access Pages**: Open your web browser and navigate to:
    *   Homepage: `http://localhost:8000/main.html`
    *   Catalog: `http://localhost:8000/catalog.html`
    *   Vinyl Library: `http://localhost:8000/program.xml` (This relies on the server serving correct MIME types for XSLT transformation)

### Deployed Version

The website is automatically deployed to GitHub Pages. The live URL will be based on your GitHub username and repository name (e.g., `https://<username>.github.io/<repository-name>/`). Note that GitHub Pages uses `index.html` as the entry point, which is a copy of `main.html` created during deployment.

## Technologies Used

-   HTML5
-   CSS3 (including Flexbox, Grid, Animations, Glassmorphism)
-   XML 1.0
-   DTD (Document Type Definition)
-   XSLT 1.0 (Extensible Stylesheet Language Transformations)
-   Font Awesome (for icons)
-   GitHub Actions (for CI/CD)
-   Python (for local development server)

## Browser Compatibility

The website leverages modern CSS and relies on browser support for client-side XSLT 1.0 transformation. It is expected to work best on recent versions of:

-   Google Chrome
-   Mozilla Firefox
-   Microsoft Edge
-   Safari

*(Note: Client-side XSLT support can vary slightly between browsers, but the implementation uses standard features.)*
