# React Project Creator
This project allows you to utilize docker to both create a new project and utilize docker for a development enviornment for React.

The first time you run the powershell script it grabs the base image and installs the React dependencies, then leverages react-creat-app application to create a base react application. *Note* You do have to mount that directory within docker desktop for it to work properly.  Once the project is created, a new instance is spun up and your application is ran in development.  If all was successful, you can access your application via http://localhost:3000, and you can immediately start editing the source and it will hot reload. 
