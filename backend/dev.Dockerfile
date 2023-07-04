#safe and non-optimised selection for base image...
FROM node:18.16

WORKDIR /usr/src/app

COPY --chown=node:node . .

RUN npm install

RUN npm run test

#ENV DEBUG=playground:*

USER node

ENV MONGODB_URI=mongodb+srv://jkemppainen:perusukko@jkcluster0.q4kt7z0.mongodb.net/blogApp?retryWrites=true&w=majority
ENV PORT=3003


# the next line (nodemon call) requires proper .gitignore file to work:
CMD ["npm", "run", "dev"]
#CMD ["npm", "start"]

## docker build . -t blogapp-dev-back-image2 -f dev.Dockerfile
## docker run --rm --name blogapp-dev-back-kontti2 -p 3003:3003 blogapp-dev-back-image2

## test with browser: 
#    OK: http://localhost:3003/api/blogs
#    OK: http://localhost:3003/api/users
