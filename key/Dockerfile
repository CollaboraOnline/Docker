FROM ubuntu:16.04

# Environment variables
ARG REPOS

# Setup scripts for LibreOffice Online
ADD /scripts/install-libreoffice.sh /
ADD /scripts/start-libreoffice.sh /
RUN bash install-libreoffice.sh
RUN rm -rf /install-libreoffice.sh

# Environment variables
ENV domain localhost
ENV LC_CTYPE en_US.UTF-8

# Entry point
CMD bash start-libreoffice.sh
