ARG  NODE_VERSION='18.12.1'
ARG CHROME_VERSION= '119.0.6045.160'

FROM cypress/base:18.12.1
# make directory inside container
RUN mkdir /herTest
WORKDIR /herTest
# copy cypress code from host to container
COPY . .

RUN apt update
---------------------------------------------------------
Install
npm install multiple-cucumber-html-reporter --save-dev
Create
generate-cucumber-html-reporter.js
Execute
node generate-cucumber-html-reporter.js
recurso: https://automationqahub.com/how-to-generate-html-report-in-cypress-framework/
---------------------------------------------------------

# Install Cypress dependencies
RUN apt-get update && apt-get install -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libgbm-dev \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  xauth \
  xvfb

RUN npm install
#ENTRYPOINT [ "npx", "cypress", "run" ]
CMD [ "" ]


docker run -it demo npm run qa2 - ok
docker run -it demo npx cypress run --env ENV=qa,TAGS=@smoke
------------------------------------------
version: '3'
services: 
  e2e:
    build:
      context: .
      dockerfile: Dockerfile
    command: npx cypress run --env ENV=qa,TAGS=@smoke 
    volumes:
      - ./cypress/videos:/herTest/cypress/videos
      - ./cypress/reports:/herTest/cypress/reports
      

docker-compose up
-----------------------------------------
https://programadorwebvalencia.com/levantar-cypress-en-modo-grafico-sobre-docker/
http://localhost:8080/vnc.html

version: '3'

services:

  e2e:
    build:
      context: .
      dockerfile: Dockerfile
    command: npx cypress open
    environment:
      - DISPLAY=novnc:0
    working_dir: /herTest
    volumes:
      - ./cypress/videos:/herTest/cypress/videos
    depends_on:
      - novnc
    networks:
      - x11

  novnc:
    image: theasp/novnc:latest
    environment:
      # Adjust to your screen size
      - DISPLAY_WIDTH=1600
      - DISPLAY_HEIGHT=968
      - RUN_XTERM=no
    ports:
      - 8080:8080
      - 5900:5900
    networks:
      - x11

networks:
  x11:

  docker-compose run e2e

  # https://filiphric.com/cypress-and-git-hub-actions-step-by-step-guide