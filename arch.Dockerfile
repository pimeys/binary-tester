FROM archlinux:base-devel

WORKDIR /app

RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -S nodejs npm

RUN npm install prisma@dev @prisma/client@dev
RUN npx prisma -v

COPY prisma/schema.prisma ./prisma/

RUN npx prisma db push
RUN npx prisma generate
