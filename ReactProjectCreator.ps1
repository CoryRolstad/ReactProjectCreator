param (
    [Parameter(Mandatory=$true)][string]$appName = $( Read-Host "Application Name"),
    [Parameter(Mandatory=$true)][string]$appDirectory = $( Read-Host "Full Application Directory Path"),
 )
"FROM node:latest
 RUN npm install -g npm@8.3.0
 RUN npm install -g create-react-app \
                    create-react-native-app \
                    react-native-cli
 WORKDIR /app" | Out-File -Encoding utf8 -FilePath ./Dockerfile

docker build -t react/cli .
docker run -v ${appDirectory}:/app react/cli create-react-app $appName
docker run -p 3000:3000 -v ${appDirectory}/${appName}:/app react/cli npm start