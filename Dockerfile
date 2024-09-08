# Use a base image with a minimal setup
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget tar

# Download and install OpenJDK 22
RUN wget https://download.oracle.com/java/22/latest/jdk-22_linux-aarch64_bin.tar.gz && \
    tar -xzf openjdk-22-ea+30_linux-x64_bin.tar.gz && \
    mv jdk-22 /usr/local/openjdk-22 && \
    rm openjdk-22-ea+30_linux-x64_bin.tar.gz

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/local/openjdk-22
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Set the working directory in the Docker container
WORKDIR /app

# Copy the JAR file from the current directory into the Docker container
COPY DadJokes-0.0.1.jar /app/DadJokes-0.0.1.jar

# Specify the command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/DadJokes-0.0.1.jar"]
