FROM alwinw/actions-ci-lint:latest

COPY src /src
RUN chmod +x /src/entrypoint.sh

RUN apt add git

ENTRYPOINT [ "/src/entrypoint.sh" ]