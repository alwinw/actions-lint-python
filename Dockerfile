FROM alwinw/actions-ci-lint:latest

COPY src /src
RUN chmod +x /src/entrypoint.sh

RUN apk add git
RUN pip install autopep8

ENTRYPOINT [ "/src/entrypoint.sh" ]