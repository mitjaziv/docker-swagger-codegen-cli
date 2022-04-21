FROM adoptopenjdk/openjdk11:jdk-11.0.14.1_1-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /app

ENV SWAGGER_CODEGEN_CLI_VERSION=2.4.27 \
    SWAGGER_CODEGEN_CLI_SHA256=a827031b2efb80a547f8a206f48b875a87f269bd382a6678b8e563e1d0fcb806

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
