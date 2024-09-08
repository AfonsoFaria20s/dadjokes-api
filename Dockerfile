# Use an official base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget tar

# Download and install OpenJDK 22
RUN wget https://download.java.net/java/early_access/jdk22/27/GPL/openjdk-22-ea+27_linux-x64_bin.tar.gz && \
    tar -xzf openjdk-22-ea+27_linux-x64_bin.tar.gz && \
    mv jdk-22 /usr/local/openjdk-22 && \
    rm openjdk-22-ea+27_linux-x64_bin.tar.gz

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/local/openjdk-22
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Set the working directory in the Docker container
WORKDIR /app

# Copy the JAR file from the target directory into the Docker container
COPY DadJokes-0.0.1.jar /app/DadJokes-0.0.1.jar

# Specify the command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/DadJokes-0.0.1.jar"]
