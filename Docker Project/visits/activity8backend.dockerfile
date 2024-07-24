# Use official Node.js image as the base image for the backend
FROM node:14

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY backend/package*.json ./

# Install app dependencies
RUN npm install

# Copy all source code to the working directory
COPY backend/ .

# Expose port 3000 to outside the container
EXPOSE 3000

# Command to run the Node.js application
CMD ["node", "index.js"]