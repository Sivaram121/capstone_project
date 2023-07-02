# Copy package.json and package-lock.json to the working directory
# Base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
#COPY /home/sivaram/Documents/reactjs-demo/public/ ./public/
#COPY /home/sivaram/Documents/reactjs-demo/src/ ./src/ 
COPY . .

# Build the React app for production
RUN npm run build

# Set the environment variable to production
ENV NODE_ENV=production

# Expose the port that the React app will run on
EXPOSE 80

# Start the React app
CMD [ "npm", "start" ]


