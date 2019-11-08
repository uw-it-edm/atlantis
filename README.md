# Atlantis

Small customization on top of https://hub.docker.com/r/runatlantis/atlantis to allow using ssh@git urls when cloning private repos.
It'll use the `ATLANTIS_GH_USER` and `ATLANTIS_GH_TOKEN` to login against github

# Deployment

## Publish Docker Image to Repository
### Automated build & publication
Every new git release is built and pushed to [docker hub]( https://cloud.docker.com/u/uwitedm/repository/docker/uwitedm/atlantis) by the [Deploy to docker hub Github Action](https://github.com/uw-it-edm/atlantis/actions) actions which are defined in [.github/workflows](https://github.com/uw-it-edm/atlantis/tree/master/.github/workflows).



### Manual build & publication
To build, tag, and push the docker image to [docker hub]( https://cloud.docker.com/u/uwitedm/repository/docker/uwitedm/atlantis), on your local machine
```
# docker login 
# docker build -t uwitedm/atlantis:v1.2.3 .
# docker push uwitedm/atlantis:v1.2.3

```
