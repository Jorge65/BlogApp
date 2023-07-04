#non-optimised selection for base image...
FROM node:18.16 as build-stage

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

RUN CI=true npm run test

ENV NODE_ENV=production
RUN npm run build

####### temporary test for checking the production build directory...
#RUN npm install -g serve
#EXPOSE 3000
#CMD serve -s build
# this works...

FROM nginx:1.20-alpine
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html

########## building and testing commands ###############
## docker build . -t blogapp-front-image 
## docker run --rm --name blogapp-front-kontti -p 3000:80 blogapp-front-image

## test with browser: 
#    OK: http://localhost:3000
