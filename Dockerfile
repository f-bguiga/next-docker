# Use Node.js LTS version as the base image
FROM node:lts-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Start a new stage with a smaller image
FROM node:lts-alpine

# Set the working directory
WORKDIR /app

# Copy built files from the previous stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json ./package.json

# Expose the port Next.js is running on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]