# CAB-7493 upgrade from v0.25 to v0.48
# CAB-5994 upgrade atlantis to v0.25
# atlantis moved from dockerhub to ghcr starting with 0.18.5
FROM ghcr.io/runatlantis/atlantis:v0.48-alpine

# default build time user becomes atlantis starting with v0.27
# Switch to root to run chmod and chown etc.
USER root

COPY --chmod=755 credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY --chown=atlantis:atlantis gitconfig /home/atlantis/.gitconfig
RUN chown atlantis:atlantis /home/atlantis/.gitconfig

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.48.6/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.48 \
  && echo "23a54c6b13d001e3f295cfc30c0fe5e0a16263ec582f4ffd11526c2f497a863e  /usr/local/bin/terragrunt-0.48" \
  | sha256sum -c

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v1.1.6/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-1.1 \
  && echo "d75a80bb264758ba00dabcb17f4b507fcdab4ca90d9e41f96750df036bf69b04 /usr/local/bin/terragrunt-1.1" \
  | sha256sum -c

RUN ln -s /usr/local/bin/terragrunt-1.1 /usr/local/bin/terragrunt

RUN chmod +x /usr/local/bin/terragrunt*

COPY atlantis.yaml /home/atlantis/atlantis.yaml
RUN chown atlantis:atlantis /home/atlantis/atlantis.yaml

# reset user to atlantis
USER atlantis
