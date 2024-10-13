FROM python:3.12-slim

WORKDIR /app

# Copy source code
COPY . .

# Install libraries for necessary python package builds
RUN apt-get clean && apt-get update \
    && apt-get --no-install-recommends install build-essential python3-dev libpq-dev curl -y \
    && pip install --no-cache-dir --upgrade pip \
    && apt-get -yq update && apt-get -yqq install ssh \
    && apt-get clean \
    && pip install -r requirements.txt

# Run the deploy.py script
ENTRYPOINT [ "python", "deploy.py" ]