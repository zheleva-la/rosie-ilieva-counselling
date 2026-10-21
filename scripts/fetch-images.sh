#!/usr/bin/env bash
# Downloads the photos and badges from the old WordPress site into /images.
# Run once from the repo root while the old site is still online:
#   bash scripts/fetch-images.sh
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p images
base="https://rosie-ilieva-counselling.co.uk/wp-content/uploads"
fetch() { echo "→ images/$2"; curl -fsSL "$base/$1" -o "images/$2"; }

fetch 2024/07/rosie.jpg         rosie.jpg
fetch 2024/07/path.jpg          path.jpg
fetch 2024/07/tree.jpg          tree.jpg
fetch 2024/07/waves-scaled.jpg  waves.jpg
fetch 2024/07/registered_id.png registered_id.png
fetch 2024/07/PCA.png           PCA.png
echo "Done."
