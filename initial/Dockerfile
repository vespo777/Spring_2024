#FROM maven:latest as builder
#
#WORKDIR /app
#
#COPY . .
#
#RUN mvn clean package -DskipTests
#
#FROM openjdk:22-slim-bullseye
#
#WORKDIR /app
#
#COPY --from=builder /app/target/consuming-web-service-initial-0.0.1-SNAPSHOT.jar .
#
#ARG PORT=8081
#
#ENV PORT=${PORT}
#
#EXPOSE ${PORT}
#
#CMD ["java", "-jar", "consuming-web-service-initial-0.0.1-SNAPSHOT.jar", "--server.port=${PORT}"]

#FROM eclipse-temurin:17-jdk-alpine
#VOLUME /tmp
#COPY consuming-web-service-initial.jar app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

# Use multi-stage builds for a smaller final image size
# Use Maven as a builder to compile the application
FROM maven:latest as builder

WORKDIR /app

# Copy the Maven project files and compile the application
COPY . .
RUN mvn clean package -DskipTests

# Use a smaller JDK base image for the final application image
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the compiled JAR file from the builder stage
COPY --from=builder /app/target/consuming-web-service-initial-0.0.1-SNAPSHOT.jar .

# Set the default port
ARG PORT=8081
ENV PORT=${PORT}
EXPOSE ${PORT}

