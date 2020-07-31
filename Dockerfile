FROM ubuntu:18.04

RUN apt-get update && apt-get install -y locales libpq-dev
RUN echo "en_US UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
COPY stack.sh /root
RUN sh /root/stack.sh
COPY concat-stack.yaml /root
RUN cd /root/ && git clone https://github.com/joseprous/yesod-sample.git && cd yesod-sample && stack build && cd .. && rm -rf yesod-sample
