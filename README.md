# Docker
Scripts and Dockerfiles to build Collabora Online Docker image

To build the container first you need to build the base image and flatten it (to get rid of the history):

```
cd baseimage/
docker build --build-arg SECRET_KEY=<your secret URL part from https://support.libreoffice.collabora.co.uk> -t collabora/online-base .
docker run -d collabora/online-base
# Adjust the container id <hash>
docker export <hash> -o /tmp/collabora-flat
docker import /tmp/collabora-flat collabora/online-flattened
```

Afterwards you can build the regular container:
```
cd online/
docker build -t collabora/online .
docker history collabora/online
```

Do not share the secret key with anyone.
