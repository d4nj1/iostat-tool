FROM amazonlinux:2
MAINTAINER Daniel Christophis <code@devmind.org>

ARG UID=1024
ARG GID=1024

RUN yum update -y
RUN yum install -y \
    shadow-utils.x86_64 \
    python3-pip

RUN groupadd -r -g $GID tool
RUN useradd -r -m -s /bin/bash -g $GID -u $UID tool
USER tool
WORKDIR /home/tool

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

COPY --chown=tool:tool Pipfile /home/tool/
RUN pip3 install pipenv --user
RUN /home/tool/.local/bin/pipenv install
COPY --chown=tool:tool iostat /home/tool/iostat

ENTRYPOINT [ "/home/tool/.local/bin/pipenv", "run", "python3", "-m", "iostat" ]
