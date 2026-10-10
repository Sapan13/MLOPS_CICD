#python:3.10-slim debian variant of linux

# Using slim version to keep the image size small
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /CICDApp

# Copy the requirements file into the container at /CICDApp
COPY requirements.txt /CICDApp/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /CICDApp
COPY lec9_CI/ ./CICDApp

# Make port 8000 available to the world outside this container
#CMD ["python", "-m", "flask", "--app", "hello_flask.py", "run", "--host=0.0.0.0", "--port=9000"]

CMD ["python", "-c", "from CICDApp.base_file import add; print(add(2, 3))"]
# RUN command runs only once, when the container is being built. CMD command runs every time the container is started.

#docker run -p 8000:9000 oct8
# first 8000 is host port and second 9000 is container port
