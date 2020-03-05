FROM ubuntu:18.04

# Environment variables
ARG SECRET_KEY
ARG REPOS

# Setup scripts for LibreOffice Online
ADD /scripts/install-libreoffice.sh /
ADD /scripts/start-libreoffice.sh /
RUN bash install-libreoffice.sh
RUN rm -rf /install-libreoffice.sh
