# Use the Debian Bullseye base image
FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

# Expose the default Redis port
EXPOSE 6379

# Command to run when the container starts
CMD ["redis-server"]
