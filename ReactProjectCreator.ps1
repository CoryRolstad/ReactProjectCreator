param (
    [Parameter(Mandatory=$true)][string]$appName = $( Read-Host "Application Name"),
    [Parameter(Mandatory=$true)][string]$appDirectory = $( Read-Host "Full Application Directory Path")
 )
"FROM node:latest
 RUN npm install -g npm@latest
 RUN npm install -g create-react-app \
                    create-react-native-app \
                    react-native-cli
 WORKDIR /app" | Out-File -Encoding utf8 -FilePath ${appDirectory}/Dockerfile

"version: '3.1'

services:

  react:
    image: react/cli
    restart: always
    command: npm start
    ports:
      - 3000:3000
    volumes:
      - ./${appName}:/app

volumes:
  wordpress:" | Out-File -Encoding utf8 -FilePath ${appDirectory}/docker-compose.yml

docker build . -t react/cli -f ${appDirectory}/Dockerfile
docker run -v ${appDirectory}:/app react/cli create-react-app $appName