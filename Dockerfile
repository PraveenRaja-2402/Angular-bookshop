# Use Node.js 18 (LTS) as the base image for building
FROM node:18 as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install Angular CLI and project dependencies
RUN npm install -g @angular/cli@16.2.10
RUN npm install

# Copy the entire project to the container
COPY . .

# Build the Angular app for production
RUN ng build 

# Use NGINX as the server for serving the app
FROM nginx:alpine

# Copy the built app from the previous stage to NGINX directory
COPY --from=build /app/dist/bookshop /usr/share/nginx/html

# Replace default NGINX configuration with custom configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the default NGINX port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]

