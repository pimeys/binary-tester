FROM node:16-alpine3.16

WORKDIR /app

RUN npm install prisma@4.8.0-integration-engines-4-8-0-39-integration-alpine-builds-a1ecc68a71a05f6afb563825c86ba79e3e917b9e.1 @prisma/client@4.8.0-integration-engines-4-8-0-39-integration-alpine-builds-a1ecc68a71a05f6afb563825c86ba79e3e917b9e.1
RUN npx prisma -v

COPY prisma/schema.prisma ./prisma/

RUN npx prisma db push
RUN npx prisma generate
