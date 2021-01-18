FROM ubuntu:18.04

ARG FING_ARCHIVE_URL=https://www.fing.com/images/uploads/general/CLI_Linux_Debian_5.5.2.zip

RUN apt-get update -qq && \
    apt-get install -qqy curl unzip && \
    mkdir -p /tmp/fing-download && \
    cd /tmp/fing-download && \
    curl -Ok ${FING_ARCHIVE_URL} && unzip $(basename ${FING_ARCHIVE_URL})  && \
    dpkg -i /tmp/fing-download/fing-*-amd64.deb && \
    rm -rf /tmp/fing-download && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/fing
# RUN ls -la /usr/bin

ENTRYPOINT ["/usr/bin/fing", "-n 192.168.1.0/24 -r 1 --session /home/fing/discover.log -o table,json,/home/fing/table.json"]
# CMD ["--help"]

# EOF

# Run with docker run -ti --rm --net=host -v /home/kgerbers/Git/docker-fing/data:/home/fing kgerbers/fing