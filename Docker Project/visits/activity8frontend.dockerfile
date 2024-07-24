# Use official Node.js image as the base image for building the React app
FROM node:14 as build

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY frontend/package*.json ./

# Install app dependencies
RUN npm install

# Copy all source code to the working directory
COPY frontend/ .

# Build the React app
RUN npm run build

# Use lightweight Nginx image as the final base image to serve the React app
FROM nginx:alpine

# Copy build files from build stage to serve with Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to outside the container
EXPOSE 80

# Default command to start Nginx when container starts
CMD ["nginx", "-g", "daemon off;"]