FROM ubuntu:18.04

ARG FING_ARCHIVE_URL=https://www.fing.com/images/uploads/general/CLI_Linux_Debian_5.5.2.zip

# @todo: ARG only works for first build, it should work for all builds even with cached stages

RUN export FING_ARCHIVE_URL=https://www.fing.com/images/uploads/general/CLI_Linux_Debian_5.5.2.zip && \
    apt-get update -qq && \
    apt-get install -qqy curl unzip && \
    mkdir -p /tmp/fing-download && \
    cd /tmp/fing-download && \
    curl -Ok "$FING_ARCHIVE_URL" && unzip $(basename "$FING_ARCHIVE_URL") && \
    dpkg -i /tmp/fing-download/fing-*-amd64.deb && \
    rm -rf /tmp/fing-download && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /home/fing

# Original endpoint; uncomment to run with other arguments than my defaults (and comment-out/delete the other)
#ENTRYPOINT ["/usr/bin/fing"]

ENTRYPOINT ["/usr/bin/fing", "-n 192.168.1.0/24 -r 100 --session /home/fing/discover.log -o table,json,/home/fing/table.json -d 1"]
# CMD ["--help"]

# EOF
