# Docker
Scripts and Dockerfiles to build Collabora Online Docker image

To build the container first you need to build the base image and flatten it (to get rid of the history):

```
cd baseimage/
docker build --build-arg SECRET_KEY=<your secret URL part from https://support.collaboraoffice.com, e.g. Example-413539ece39485afc35b4a469adfde0a279d2fd2> -t collabora/online-base .
docker run -d collabora/online-base
# Adjust the container id <hash>
docker export -o /tmp/collabora-flat <hash>
docker import /tmp/collabora-flat collabora/online-flattened
```

Afterwards you can build the regular container:
```
cd online/
docker build -t collabora/online .
docker history collabora/online
```

Do not share the secret key with anyone.

start-libreoffice.sh script watches /etc/loolwsd/loolwsd.xml via inotify and forces a restart of the container, in case something changes.

## License key enabled docker image

In directory "key" there is the Dockerfile to build Collabora Online image with support-key, see e.g.:

    quay.io/egroupware/collabora-key

The container is - apart from the repo url - identical to the baseimage container.
