FROM python:3.12

WORKDIR /app

# Copy requirements.txt from the build context root into the container's /app
COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# CRITICAL CHANGE: Instead of 'COPY . .', which would put your app code
# in /app/app, this command copies the *contents* of the local
# 'app/' folder (e.g., your Python files) into the container's /app
# working directory.
COPY app/ .

EXPOSE 8080

# This CMD remains correct since your flask application files are now
# directly in the /app folder (the WORKDIR).
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0","--port=8080"]