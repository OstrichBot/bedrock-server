# Use Ubuntu as base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends unzip apt-utils libcurl4-openssl-dev ca-certificates curl wget

# Expose minecraft bedrock port IPv4
EXPOSE 19132/udp

# Expose minecraft bedrock port IPv6
EXPOSE 19133/udp

# Set volume & workdir
WORKDIR /bedrock-server

# Download latest bedrock server from Microsoft
RUN wget -O bedrock-server.zip $(curl -G https://www.minecraft.net/en-us/download/server/bedrock/ 2>&1 | grep -Eo "https://minecraft.azureedge.net/bin-linux/bedrock-server-.*\.zip") && unzip bedrock-server.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# Start server
CMD ./bedrock_server
