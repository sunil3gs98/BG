# Stage 1: Build the application
FROM maven:3.8.5-jdk-11-slim AS builder
WORKDIR /app

# Copy the Maven wrapper and pom.xml first to leverage Docker cache
#COPY .mvn/ .mvn
COPY mvnw ./
COPY pom.xml ./

# Ensure the Maven wrapper script is executable
RUN chmod +x mvnw

# Copy the rest of the application code
COPY src ./src

# Build the project
RUN mvn clean install

# Stage 2: Run the application
FROM openjdk:11-jre-slim AS final
WORKDIR /app
EXPOSE 8080

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/*.jar /app/app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]
