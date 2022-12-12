FROM archlinux:base-devel

WORKDIR /app

RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -S nodejs npm

RUN npm install prisma@4.8.0-integration-debian-is-now-rhel.2 @prisma/client@4.8.0-integration-debian-is-now-rhel.2
RUN npx prisma -v

COPY prisma/schema.prisma ./prisma/

RUN npx prisma db push
RUN npx prisma generate
