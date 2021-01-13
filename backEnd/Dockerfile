#  Use the Python3.7.2 image
FROM python:3.7.2-stretch

# Set the working directory to /app
WORKDIR /app  

# Copy the current directory contents into the container at /app 
COPY manage.py .
COPY  config.py .

# Install the dependencies
RUN pip install  sanic && pip install SQLAlchemy && pip install mysql-connector-python

CMD [ "python3","./manage.py" ]