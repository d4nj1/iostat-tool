FROM amazonlinux:2
MAINTAINER Daniel Christophis <code@devmind.org>

ARG UID=1024
ARG GID=1024

RUN yum update -y
RUN yum install -y \
    shadow-utils.x86_64 \
    python3-pip \
    which

RUN groupadd -r -g $GID cli
RUN useradd -r -m -s /bin/bash -g $GID -u $UID cli
USER cli
WORKDIR /home/cli

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

COPY --chown=cli:cli Pipfile /home/cli/
RUN pip3 install pipenv --user
RUN /home/cli/.local/bin/pipenv install
COPY --chown=cli:cli iostat /home/cli/iostat

ENTRYPOINT [ "/home/cli/.local/bin/pipenv", "run", "python3", "-m", "iostat" ]
