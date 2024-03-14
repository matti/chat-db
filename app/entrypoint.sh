#!/usr/bin/env bash

set -eEuo pipefail

case "$1" in
  run)
    exec node index.mjs
    ;;
  web)
    exec ttyd --port 3000 --writable /app/entrypoint.sh run
  ;;
  hang)
    echo "hang"
    exec tail -f /dev/null
  ;;
esac
