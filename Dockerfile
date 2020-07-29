FROM ubuntu:20.04

RUN apt-get update && apt-get install -y locales libpq-dev
RUN echo "en_US UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY stack.sh /root
RUN sh /root/stack.sh
RUN cd /root/ && stack new my-project yesodweb/postgres --resolver=lts-14.27 && cd my-project && stack build && cd .. && rm -rf my-project
