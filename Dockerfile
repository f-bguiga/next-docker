FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /usr/share/nginx/www/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master
RUN cd /usr/share/nginx/www/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
# # Use an official Node.js LTS (Long Term Support) image as the base image
# FROM node:20-alpine

# # Set the working directory inside the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json to the working directory
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code to the working directory
# COPY . .

# # Build the Next.js app for production
# RUN npm run build

# # Expose the port that the app will run on
# EXPOSE 3000

# # Start the Next.js app
# CMD ["npm", "start"]