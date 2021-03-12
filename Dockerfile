FROM openjdk:11-jre-slim as builder
WORKDIR application
ADD target/jenkins-*.jar jenkins.jar
RUN java -Djarmode=layertools -jar jenkins.jar extract

FROM openjdk:11-jre-slim
LABEL PROJECT_NAME=jenkins \
      PROJECT=jenkins

EXPOSE 8080

WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "org.springframework.boot.loader.JarLauncher"]