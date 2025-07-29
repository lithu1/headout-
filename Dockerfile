FROM openjdk:17-jdk-slim
WORKDIR /app
COPY build/libs/project.jar app.jar
EXPOSE 9000
CMD ["java", "-jar", "app.jar"]
