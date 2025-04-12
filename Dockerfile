# Start from a base image with Java
FROM openjdk:21-jdk-slim

# Add a volume to hold the application
VOLUME /app

# Set the working directory
WORKDIR /app

# Copy the built jar file into the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose port (used in local only; Render will map PORT)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","/app/app.jar"]
