# CAB-5994 upgrade atlantis to v0.25
# atlantis moved from dockerhub to ghcr starting with 0.18.5
FROM ghcr.io/runatlantis/atlantis:v0.25-alpine

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY gitconfig /home/atlantis/.gitconfig
RUN chown atlantis /home/atlantis/.gitconfig


# copy a terraform binary of the version you need and validate checksum
RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.7/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.18 \
  && echo "3a45138e77fb41e0884b9491c67dcdeacd06418cd10a1e16ea0cc03976f1b288  /usr/local/bin/terragrunt-0.18" \
  | sha256sum -c

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.20.4/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.20 \
  && echo "6fca4db39a191ee898a38fce201936324c6cf84bd3ba0fce8ecbddbdfc25d82a  /usr/local/bin/terragrunt-0.20" \
  | sha256sum -c

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.48.6/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.48 \
  && echo "23a54c6b13d001e3f295cfc30c0fe5e0a16263ec582f4ffd11526c2f497a863e  /usr/local/bin/terragrunt-0.48" \
  | sha256sum -c

RUN ln -s /usr/local/bin/terragrunt-0.48 /usr/local/bin/terragrunt

RUN chmod +x /usr/local/bin/terragrunt*

COPY atlantis.yaml /home/atlantis/atlantis.yaml

