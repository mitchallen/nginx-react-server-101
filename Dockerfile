# Stage 1 - Build

FROM node:alpine as builder 

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY demo-app/*.json ./
COPY demo-app/*.lock ./
COPY demo-app/public ./public
COPY demo-app/src ./src

# Build for non-prod
RUN npm install 

#Build the project for production
RUN npm run build 

# --------------------------

# Stage 2 - Deploy

FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf

# Copy 404.html over - mapped in default.conf
COPY src /usr/share/nginx/html

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
