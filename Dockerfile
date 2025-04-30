# Build stage
FROM eclipse-temurin:24-jdk-alpine as build
WORKDIR /workspace/app

# Copy the project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN apk add --no-cache maven
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:24-jre-alpine
VOLUME /tmp

# Copy the jar file
COPY --from=build /workspace/app/target/*.jar app.jar

# Set the entry point
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Create the uploads directory
RUN mkdir -p /app/uploads
VOLUME /app/uploads

# Expose port
EXPOSE 8080