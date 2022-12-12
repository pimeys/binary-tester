FROM debian:jessie

WORKDIR /app

RUN apt-get update
RUN apt-get install -y --force-yes curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 

RUN export NVM_DIR="$HOME/.nvm" && \
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
      nvm install v14.17 && \
      nvm use v14.17 && \
      node -v && \
      npm -v

RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    npm install prisma@4.8.0-integration-debian-is-now-rhel.2 @prisma/client@4.8.0-integration-debian-is-now-rhel.2

RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    npx prisma -v && npx prisma init

COPY prisma/schema.prisma ./prisma/schema.prisma

RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    npx prisma db push
