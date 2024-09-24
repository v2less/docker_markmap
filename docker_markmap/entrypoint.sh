#!/bin/bash
cd /project || exit 1
rm -rf /html/*.html || exit 1
read -ra mds <<< "$(find . -maxdepth 1 -name "*.md" | tr "\n" " " | sed 's|./||')"
for file in "${mds[@]}"; do
    filename="${file%.md}"
    markmap "${file}" --offline --output "/html/${filename}.html"
done
