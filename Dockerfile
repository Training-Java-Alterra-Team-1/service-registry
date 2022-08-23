FROM openjdk:1.8
EXPOSE 8085
COPY target/sevice-registry-0.0.1.jar service-registry-0.0.1.jar
ENTRYPOINT ["java", "-jar", "/service-registry-0.0.1.jar"]