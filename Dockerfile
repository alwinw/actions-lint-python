# GitHub Action docker-based image
# Not intended for local development

FROM python:3.7-alpine

LABEL "com.github.actions.name"="Lint Python"
LABEL "com.github.actions.description"="GitHub Action to run various linters and code checkers on python files"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

LABEL "com.github.actions.repository"="https://github.com/AlwinW/action-lint-python/"
LABEL "com.github.actions.homepage"="https://github.com/AlwinW/action-lint-python/"
LABEL "com.github.actions.maintainer"="AlwinW <16846521+AlwinW@users.noreply.github.com>"

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN pip install -r requirements.txt
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]