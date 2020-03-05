FROM ubuntu:18.04

# Environment variables
ARG REPOS
ENV domain localhost
ENV LC_CTYPE en_US.UTF-8

# Setup scripts for LibreOffice Online
ADD /scripts/install-libreoffice.sh /
ADD /scripts/start-libreoffice.sh /
RUN bash install-libreoffice.sh
RUN rm -rf /install-libreoffice.sh

EXPOSE 9980

# switch to lool user
USER 101

# Entry point
CMD bash start-libreoffice.sh
