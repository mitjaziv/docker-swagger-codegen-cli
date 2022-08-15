A multi-platform Docker image for [`swagger-codegen-cli`](https://github.com/swagger-api/swagger-codegen)

# swagger-codegen-cli 2.x

This image is building multi-platform version for swagger-codegen-cli-2.4.28.
You can change version in docker file and build locally.

# Build

To build image locally run:

```bash
docker build -f Dockerfile -t "mitjaziv/swagger-codegen-cli:2.4.28" .
```

# Usage

```bash
docker run -it -v /spec:/spec "mitjaziv/swagger-codegen-cli:2.4.28" generate -i /spec/swagger.yml -l openapi
```
