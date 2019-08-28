# atlantis

Small customization on top of https://hub.docker.com/r/runatlantis/atlantis to allow using ssh@git urls when cloning private repos.
It'll use the `ATLANTIS_GH_USER` and `ATLANTIS_GH_TOKEN` to login against github

// Every new tag/release is build by dockerhub here https://cloud.docker.com/u/uwitedm/repository/docker/uwitedm/atlantis 

To build and tag the docker image, on your local machine

```
# docker login 
# docker build -t uwitedm/atlantis:v1.2.3 .
# docker push uwitedm/atlantis:v1.2.3

```
