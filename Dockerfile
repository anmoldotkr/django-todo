FROM python:3.9-slim

# set up working directory
WORKDIR /app

#copy the requirements file
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# create a directory for the SQLite db file
RUN mkdir -p db

COPY . .
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh


EXPOSE 8000

ENV DATABASE_FILE=/app/db/db.sqlite3
ENTRYPOINT ["/bin/bash","/app/entrypoint.sh"]
CMD [ "python","manage.py","runserver","0.0.0:8000" ]