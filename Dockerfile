# Use an official Node.js LTS (Long Term Support) image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js app for production
RUN npm run build

# Expose the port that the app will run on
EXPOSE 80

# Start the Next.js app
CMD ["npm", "start"]