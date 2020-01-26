FROM alwinw/actions-ci-lint:latest

COPY src /src
RUN chmod +x /src/entrypoint.sh

ENTRYPOINT [ "/src/entrypoint.sh" ]