FROM openjdk:8u212-jre-alpine

# Build arguments
ARG download_url
ARG server_properties_location
ARG default_env_location
ARG launcher_location

# APK updates
RUN apk --no-cache add ca-certificates wget gettext libintl bash python
RUN update-ca-certificates

# Download the server
RUN wget $download_url -O /server.jar

# Copy the server properties
COPY $server_properties_location /tmp/server.properties

# Expose port
EXPOSE 25565

# Set up volumes for
VOLUME ["/data","/config"]
WORKDIR /data

# EULA
COPY resources/vanilla/eula.txt eula.txt

# Copy launcher
COPY $launcher_location launcher

# Default environment variables for the server.properties file
COPY resources/env.py /tmp/env.py
COPY $default_env_location /tmp/default.env

# Run the server
ENTRYPOINT ["./launcher"]
