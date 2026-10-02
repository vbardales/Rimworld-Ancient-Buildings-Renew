#!/bin/bash
# Builds the two Workshop images from the generated sources in Art/.
#
#   Art/Preview-source.png   ->  Mod/About/Preview.png    896 x 504, under 900 KB
#   Art/ModIcon-source.png   ->  Mod/About/ModIcon.png    128 x 128, 20-30 KB
#
# The icon is reduced first. The shared Preview renderer then consumes
# Art/Preview.config.json, writes the final banner and gallery copy, and packages
# both current About images as ICO files. Diagnostics stay under Art/.render/.
set -e
cd "$(dirname "$0")/.."
mkdir -p Mod/About

ffmpeg -v error -y -i Art/ModIcon-source.png -vf "scale=128:128:flags=lanczos" \
  -compression_level 100 -pred mixed Mod/About/ModIcon.png

node ../scripts/Render-Preview.cjs

ls -l Mod/About
