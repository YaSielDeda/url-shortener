#!/bin/sh

echo "window.__env={BACKEND_URL:'${BACKEND_URL}'};" > /usr/share/nginx/html/config.js
exec "$@"