#non-optimised selection for base image...
FROM node:18.16

WORKDIR /usr/src/app

COPY . .

RUN npm install

RUN CI=true npm run test

CMD ["npm", "start"]

########## building and testing commands ###############
## docker build . -t blogapp-dev-front-image2 -f dev.Dockerfile
## docker run --rm --name blogapp-dev-front-kontti2 -p 3000:3000 blogapp-dev-front-image2

## test with browser: 
#    OK: http://localhost:3000