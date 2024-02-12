# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the application files to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Expose port 3000 (or the port your Next.js app is configured to run on)
EXPOSE 3000

# Define the command to start the Next.js application
CMD ["npm", "start"]