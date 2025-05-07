# # FROM eclipse-temurin:17-jdk-alpine
# FROM eclipse-temurin:17-jre-alpine

# EXPOSE 8080

# RUN ls 

# ENV APP_HOME /usr/src/app

# COPY app/*.jar $APP_HOME/app.jar

# WORKDIR $APP_HOME

# CMD ["java", "-jar", "app.jar"]


# FROM eclipse-temurin:17-jdk-alpine
FROM eclipse-temurin:17-jre-alpine

# Create a new user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /usr/src/app

# Copy the jar file into the container
COPY ./Github-Action-labs/Github-Action-labs/app/*.jar app.jar

# Expose the necessary port
EXPOSE 8080

# Run the application with a non-root user
USER appuser

# Set the environment variable for the app
ENV APP_HOME /usr/src/app

# Run the application
CMD ["java", "-jar", "app.jar"]
