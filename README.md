# django-todo
A simple todo app built with django

![todo App](https://raw.githubusercontent.com/shreys7/django-todo/develop/staticfiles/todoApp.png)
### Setup
To get this repository, run the following command inside your git enabled terminal
```bash
$ git clone https://github.com/shreys7/django-todo.git
```
You will need django to be installed in you computer to run this app. Head over to https://www.djangoproject.com/download/ for the download guide

Once you have downloaded django, go to the cloned repo directory and run the following command

```bash
$ python manage.py makemigrations
```

This will create all the migrations file (database migrations) required to run this App.

Now, to apply this migrations run the following command
```bash
$ python manage.py migrate
```

One last step and then our todo App will be live. We need to create an admin user to run this App. On the terminal, type the following command and provide username, password and email for the admin user
```bash
$ python manage.py createsuperuser
```

That was pretty simple, right? Now let's make the App live. We just need to start the server now and then we can start using our simple todo App. Start the server by following command

```bash
$ python manage.py runserver
```

Once the server is hosted, head over to http://127.0.0.1:8000/todos for the App.

Cheers and Happy Coding :)
# django-todo


# Steps to run this Docker file 
1. simply open cmd go to this directory and enter
--> sudo docker-compose up --build 
--> so it will give the running container.
2. open browser and paste below in browser
--> Once the server is hosted, head over to http://127.0.0.1:8000/todos for the App.

---------------------------------
Here is a documentation for the Dockerfile:

Overview

This Dockerfile is used to create a Docker image for a Python 3.9 application that uses SQLite as a database. The image is based on the official Python 3.9 slim image.

Instructions

FROM python:3.9-slim
This line tells Docker to use the official Python 3.9 slim image as the base image for our new image.

WORKDIR /app
This line sets the working directory in the container to /app.

COPY requirements.txt .
This line copies the requirements.txt file from the current directory (i.e., the directory containing the Dockerfile) into the container at the current working directory (/app).

RUN pip install --upgrade pip
This line upgrades pip to the latest version.

RUN pip install -r requirements.txt
This line installs the dependencies specified in requirements.txt using pip.

RUN mkdir -p db
This line creates a directory named db in the container at the current working directory (/app).

COPY . .
This line copies the current directory (i.e., the directory containing the Dockerfile) into the container at the current working directory (/app).

COPY entrypoint.sh /app/entrypoint.sh
This line copies the entrypoint.sh file from the current directory into the container at /app/entrypoint.sh.

RUN chmod +x /app/entrypoint.sh
This line sets the execute permission on the entrypoint.sh file.

EXPOSE 8000
This line tells Docker that the container listens on port 8000.

ENV DATABASE_FILE=/app/db/db.sqlite3
This line sets an environment variable DATABASE_FILE to /app/db/db.sqlite3, which is the location of the SQLite database file.

ENTRYPOINT ["/bin/bash","/app/entrypoint.sh"]
This line sets the entrypoint of the container to /app/entrypoint.sh, which is a script that will be executed when the container starts.

CMD [ "python","manage.py","runserver","0.0.0:8000"]
This line sets the default command to run when the container starts. In this case, it runs the Django development server using manage.py and listens on port 8000.

Notes

The entrypoint.sh script is not included in this documentation, but it is assumed to be a script that sets up the environment and runs the application.
The requirements.txt file is not included in this documentation, but it is assumed to contain the dependencies required by the application.
The manage.py file is not included in this documentation, but it is assumed to be a Django management script that runs the development server.

--------------entrypoint.sh---------------

Overview

This Dockerfile is designed to set up a Django application with a PostgreSQL database and create a superuser with default credentials.

Environment Variables

DJANGO_SETTINGS_MODULE: Set to todoApp.settings to configure the Django application.
Commands

python manage.py makemigrations: Applies database migrations to ensure the database schema is up-to-date.
python manage.py migrate: Executes the database migrations to create the necessary tables.
python -c "...": A Python script that creates a superuser with default credentials if it doesn't already exist.
Superuser Credentials (EXAMPLE ONLY)

Username: anmol (replace with your desired username)
Email: anmol123@gmail.com (replace with your desired email)
Password: anmol@123 (replace with your desired password)
Note: These credentials are used as an example and should be replaced with your own secure credentials in a production environment.

** exec "$@"**

This command executes the default command specified in the Dockerfile or the command passed as an argument when running the Docker container.

Usage

To use this Dockerfile, create a new file named Dockerfile in your project directory and copy the contents into it. Then, build the Docker image by running the command docker build -t my-django-app . (replace my-django-app with your desired image name).

Once the image is built, you can run the container using the command docker run -p 8000:8000 my-django-app (replace my-django-app with your image name). This will start the Django application and make it accessible at http://localhost:8000.

Remember to replace the example superuser credentials with your own secure credentials before deploying the application to a production environment.
