FROM ubuntu:18.04

# Environment variables
ARG SECRET_KEY
ARG REPOS

# Setup scripts for Collabora Online
ADD /scripts/install-collabora-online.sh /
ADD /scripts/start-collabora-online.sh /
RUN bash install-collabora-online.sh
RUN rm -rf /install-collabora-online.sh
