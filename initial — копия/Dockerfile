FROM maven:latest as builder

WORKDIR /app

# Copy the Maven project files and compile the application
COPY . .
RUN mvn clean package

# Use a smaller JDK base image for the final application image
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the compiled JAR file from the builder stage
COPY --from=builder /app/target/consuming-web-service-initial-0.0.1-SNAPSHOT.jar .

# Set the default port
ARG PORT=8081
ENV PORT=${PORT}
EXPOSE ${PORT}