#
# Nightwatch.js Dockerfile
#

FROM node:14-alpine
RUN apk update && apk --no-cache upgrade && \
  apk add --no-cache \
    chromium \
    chromium-chromedriver \
    harfbuzz \
    "freetype>2.8" \
    ttf-freefont \
    bash \
    nss && \
   npm install -g \
    nightwatch \
  # Clean up obsolete files:
  && rm -rf \
    /tmp/* \
    /root/.npm

# Set NODE_PATH to be able to require globally installed packages:
ENV NODE_PATH=/usr/lib/node_modules

USER root

WORKDIR /home/node

ENTRYPOINT ["nightwatch"]
