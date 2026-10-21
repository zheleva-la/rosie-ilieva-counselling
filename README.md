# Rosie Ilieva Counselling

Static website for [rosie-ilieva-counselling.co.uk](https://rosie-ilieva-counselling.co.uk/), rebuilt from the old WordPress/IONOS site with the same content and page addresses. Plain HTML and CSS — no build step, no framework.

## Structure

```
index.html            Home
about/index.html      About
sessions/index.html   Sessions & fees
contact/index.html    Contact
404.html              Not-found page
assets/css/style.css  All styling (colours and fonts are tokens at the top)
images/               Photos and badges (see below)
_headers, _redirects  Cloudflare Pages config
sitemap.xml, robots.txt, favicon.svg
scripts/              One-off helper to copy images from the old site
```

The header and footer are repeated in each page. If you change a nav link or the phone number, update all four pages (search for `07951`).

## Images

The images come from the old site and need copying across once, while it is still online:

- Windows: `powershell -ExecutionPolicy Bypass -File scripts\fetch-images.ps1`
- macOS/Linux: `bash scripts/fetch-images.sh`

Then commit the `images/` folder. Expected files: `rosie.jpg`, `path.jpg`, `tree.jpg`, `waves.jpg`, `registered_id.png`, `PCA.png`.

## Preview locally

Pages use root-relative links (`/assets/...`), so serve the folder rather than opening the files directly:

```
python -m http.server 8000
```

Then open http://localhost:8000.

## Deploy on Cloudflare Pages

1. Cloudflare dashboard → Workers & Pages → Create → Pages → Connect to Git → pick this repo.
2. Framework preset: **None**. Build command: *(leave empty)*. Build output directory: `/`.
3. Deploy. You get a `*.pages.dev` address to check the site.
4. Once the domain is released from IONOS: add the domain to Cloudflare (or transfer it), then Pages project → Custom domains → add `rosie-ilieva-counselling.co.uk` and `www.rosie-ilieva-counselling.co.uk`.

Old WordPress addresses `/about/`, `/sessions/` and `/contact/` are unchanged, so existing links and search results keep working.
