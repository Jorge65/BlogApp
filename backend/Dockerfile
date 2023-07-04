#safe and non-optimised selection for base image...
FROM node:18.16

WORKDIR /usr/src/app

COPY --chown=node:node . .

RUN npm ci

RUN CI=true npm run test

USER node

ENV MONGODB_URI=mongodb+srv://jkemppainen:perusukko@jkcluster0.q4kt7z0.mongodb.net/blogApp?retryWrites=true&w=majority
ENV PORT=3003

ENV NODE_ENV=production

CMD ["npm", "start"]

########## building and testing commands ###############
## docker build . -t blogapp-back-image 
## docker run --rm --name blogapp-back-kontti -p 3003:3003 blogapp-back-image

## test with browser: 
#    OK: http://localhost:3003/api/blogs