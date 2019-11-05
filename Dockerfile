# Stage-1 dependencies
FROM node:10-stretch as dep

RUN mkdir /sample
WORKDIR /sample

ADD package.json .
RUN ["npm", "i", "--only=production"]


# Stage-2 final image
FROM node:10-alpine

WORKDIR /app
COPY . .

COPY --from=dep /sample/node_modules ./node_modules

EXPOSE 2368
CMD ["npm", "start", "--production"]