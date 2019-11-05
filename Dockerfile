# Stage-1 dependencies
FROM node:12-alpine as dep

RUN mkdir /sample
WORKDIR /sample

ADD package.json .

RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install --only=production\
    && apk del build-dependencies

# Stage-2 final image
FROM node:12-alpine

WORKDIR /app
COPY . .

COPY --from=dep /sample/node_modules ./node_modules

EXPOSE 2368
CMD ["npm", "start", "--production"]