FROM debian:bullseye

# installing redis-server
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6379

# launching redis without protected mode wo we can connect to it with no perm
CMD ["redis-server", "--protected-mode", "no"]
