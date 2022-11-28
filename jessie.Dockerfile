FROM debian:jessie

WORKDIR /app

RUN apt-get update
RUN apt-get install --force-yes -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install --force-yes -y nodejs

RUN npm install prisma@dev @prisma/client@dev
RUN npx prisma -v

COPY prisma/schema.prisma ./prisma/

RUN npx prisma db push
RUN npx prisma generate
