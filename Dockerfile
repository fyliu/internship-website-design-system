# Start with a Python base image
FROM squidfunk/mkdocs-material

RUN \
    --mount=type=cache,target=/var/cache/apk \
    --mount=type=cache,target=/etc/apk/cache \
    apk add nodejs npm

COPY package.json .
RUN --mount=type=cache,target=/docs/node_modules \
    --mount=type=cache,target=/root/.cache \
    --mount=type=cache,target=/root/.npm \
    npm install --save-dev

COPY . .

# Set the startup script as the entry point
ENTRYPOINT ["./entrypoint.sh"]
