FROM node:16-alpine AS BUILD
WORKDIR /build
COPY . /build
RUN npm install --production
RUN npm install nodemon --save-dev

FROM node:16-alpine
LABEL MAINTAINER="xlizer" DESCRIPTION="A music bot written using discord.js and discord-player"
WORKDIR /bot
COPY --from=BUILD /usr/lib/ /usr/lib/
COPY --from=BUILD /lib/ /lib/
COPY --from=BUILD /build/ /bot
ENV NODE_ENV production
CMD ["nodemon", "./index.js"]
