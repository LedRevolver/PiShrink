FROM ubuntu:latest
RUN apt-get update
RUN apt-get install parted udev -y
RUN mkdir /code/
COPY pishrink.sh /code/
RUN chmod +x /code/pishrink.sh

Entrypoint [ "/code/pishrink.sh" ]
