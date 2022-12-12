FROM debian:stretch

WORKDIR /app

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN npm install prisma@4.8.0-integration-debian-is-now-rhel.2 @prisma/client@4.8.0-integration-debian-is-now-rhel.2
RUN npx prisma -v

COPY prisma/schema.prisma ./prisma/

RUN npx prisma db push
RUN npx prisma generate
