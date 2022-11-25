FROM python:3.9
LABEL maintainer="Sergei Litovchenko"

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . api.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r requirements.txt

## Step 4:
# Expose port 5050
EXPOSE 5050

ENTRYPOINT [ "python" ]

## Step 5:
# Run app.py at container: launches Flask web app on localhost:5050
CMD ["api.py"]

