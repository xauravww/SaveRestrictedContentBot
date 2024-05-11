# Use Python 3.9.2 slim buster image as base
FROM python:3.9.2-slim-buster

# Set up the working directory
WORKDIR /app

# Set environment variable to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        python3 \
        python3-pip \
        ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . .

# Install Python dependencies from requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Set executable permission for bash script
RUN chmod +x bash.sh

# Expose port 8000 for external access
EXPOSE 10000

# Specify the command to run on container start
CMD ["bash", "bash.sh"]
