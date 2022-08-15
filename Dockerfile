FROM adoptopenjdk/openjdk11:jdk-11.0.14.1_1-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /app

ENV SWAGGER_CODEGEN_CLI_VERSION=2.4.28 \
    SWAGGER_CODEGEN_CLI_SHA256=4b46005b875d5d43d26158f1744ce246bf2c06da91d8cd5a01f556d8e29f7e9d

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3059
RUN wget -q \
    --continue \
    --output-document /tmp/swagger-codegen-cli.jar \
    https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/$SWAGGER_CODEGEN_CLI_VERSION/swagger-codegen-cli-$SWAGGER_CODEGEN_CLI_VERSION.jar \
    && echo "$SWAGGER_CODEGEN_CLI_SHA256 /tmp/swagger-codegen-cli.jar" | sha256sum -c - \
    && mv /tmp/swagger-codegen-cli.jar /app/swagger-codegen-cli.jar \
    && chmod a+x /app/swagger-codegen-cli.jar

ENTRYPOINT ["java", "-jar", "/app/swagger-codegen-cli.jar"]
