# Use an official Node.js runtime as a base image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the application files to the working directory
COPY . .

# Build the Next.js app for production
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Set the environment variable for Next.js
ENV NODE_ENV=production

# Start the Next.js app
CMD ["npm", "start"]