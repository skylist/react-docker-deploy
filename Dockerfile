# BUILD STEP
FROM node:12.9-alpine AS builder
LABEL maintainer 'skylist'
WORKDIR /app
COPY . .
CMD npm install && npm run build

#DEPLOY STEP
FROM m4rcu5/lighttpd
WORKDIR /var/www/localhost/htdocs
COPY --from=builder /app/build .

EXPOSE 80