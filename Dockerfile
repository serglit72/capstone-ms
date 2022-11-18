FROM python:3.8
LABEL maintainer="Sergei Litovchenko"

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 5050

ENTRYPOINT [ "python" ]

## Step 5:
# Run app.py at container launch

CMD ["app.py"]

