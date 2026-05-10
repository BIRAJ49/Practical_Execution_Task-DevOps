FROM node:22-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY --chown=node:node package.json ./
COPY --chown=node:node server.js ./
COPY --chown=node:node index.html ./

USER node

EXPOSE 3000

CMD ["node", "server.js"]
