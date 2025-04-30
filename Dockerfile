FROM eclipse-temurin:24-jdk-alpine as build
WORKDIR /workspace/app

# Copy maven executable
COPY mvnw .
COPY .mvn .mvn

# Copy the pom.xml file
COPY pom.xml .

# Build dependencies
RUN ./mvnw dependency:go-offline -B

# Copy the project source
COPY src src

# Package the application
RUN ./mvnw package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Run stage
FROM eclipse-temurin:24-jre-alpine
VOLUME /tmp

# Copy dependency to the docker image
ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# Set the entry point for the application
ENTRYPOINT ["java","-cp","app:app/lib/*","com.hadi.taskmanagement.TaskManagementSystemApplication"]

# Create the uploads directory
RUN mkdir -p /app/uploads
VOLUME /app/uploads

# Expose port
EXPOSE 8080