# Use an official Node.js LTS (Long Term Support) image as a parent image
FROM node:18.13

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI and dependencies
RUN npm install -g @angular/cli
RUN npm install

# Copy the rest of your application code to the working directory
COPY . .

# Expose the port your Angular app will run on (e.g., 4200)
EXPOSE 4200

# Start the Angular application
CMD ["ng", "serve", "--host", "0.0.0.0"]
