#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf dist

cd ../spectria
VITE_LOCAL_DATA_MODE=true npm run build

cd ../spectria-python
rm -rf src/spectria/static
cp -r ../spectria/dist src/spectria/static
uv build
