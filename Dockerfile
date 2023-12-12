ARG  NODE_VERSION='18.12.1'
ARG CHROME_VERSION= '119.0.6045.160'

# base image
FROM cypress/base:18.12.1
# set working directory
RUN mkdir /herTest
WORKDIR /herTest
# copy cypress code from host to container
COPY . .
# COPY ./cypress .
# COPY ./package.json .
# COPY ./tsconfig.json .
# COPY ./cypress.config.ts .

RUN apt update


# Install Cypress dependencies
# RUN apt-get update && apt-get install -y \
#   libgtk2.0-0 \
#   libgtk-3-0 \
#   libgbm-dev \
#   libnotify-dev \
#   libgconf-2-4 \
#   libnss3 \
#   libxss1 \
#   libasound2 \
#   libxtst6 \
#   xauth \
#   xvfb


RUN npm install

#RUN npm i cypress
#ENTRYPOINT ["npm", "run"]
CMD [ "" ]

# confirm the cypress install
#RUN ./node_modules/.bin/cypress verify

# FROM node:19-bullseye-slimdocker run -it demo npm run qa2

# WORKDIR /app

# RUN apt clean all
# RUN apt update

# ## Cypress
# RUN apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
# RUN npm i -D cypress

# Clean
#RUN npm cache clean --force
#RUN rm -rf /var/lib/apt/lists/*


# FROM cypress/base:18.15.0

# # make directory inside container
# RUN mkdir /app

# WORKDIR /app

# RUN apt clean all
# RUN apt update

# ## Cypress
# #RUN apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
# RUN npm i -D cypress

# # Clean
# RUN npm cache clean --force
# RUN rm -rf /var/lib/apt/lists/*



# copy cypress code from host to container
#COPY . .
#COPY . /app
# COPY ./cypress .
# COPY ./package.json .
# COPY ./tsconfig.json .
# COPY ./cypress.config.ts .



# execute the tests
#RUN apt update
#RUN npm install
#RUN npm i cypress --force

#RUN apt-get install libnss3

#ENTRYPOINT [ "npx", "cypress", "run" ]
#CMD [ "" ]

# RUN apt-get update && \
#     apt-get install -y xvfb
# RUN apt-get update \
# && apt-get install -y \
#    unzip \
#    wget \
#    libnss3
# RUN apt-get install -y libatk1.0-0
# RUN apt-get update && \
#     apt-get install -y libatk-bridge2.0-0
# RUN apt-get install -y libcups2
# RUN apt-get install -y libgtk-3-0
# RUN apt-get install -y libgbm1
# RUN apt-get install -y libasound2


# RUN npx cypress verify


# FROM node:14

# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Copy package.json and package-lock.json to the working directory
# COPY package*.json ./

# # Install any needed packages specified in package.json
# RUN apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
# RUN npm install

# # Copy the current directory contents into the container at /usr/src/app
# COPY . .

# # Expose the port that Cypress runs on
# EXPOSE 8080

# # Run Cypress tests
# CMD ["npm", "run", "cypress:run"]

## Cypress
#RUN apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
#RUN npm i cypress
# RUN npm install
# RUN apt update
# RUN apt-get install libnss3
#RUN npm i cypress
# Clean
#RUN npm cache clean --force
#RUN rm -rf /var/lib/apt/lists/*#