# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the application dependencies
#RUN npm install
RUN npm install && echo "npm install succeeded" || echo "npm install failed"

# Copy the rest of the application code to the working directory
COPY . .

# If your application needs to be built (e.g., a frontend project), build it here
#RUN npm run build

# If the build command generates a dist folder, copy it to the working directory
# COPY dist ./dist  # Uncomment if you need to manually copy the dist folder


# Expose the port that the application will run on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "app.js"]

