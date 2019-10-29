FROM runatlantis/atlantis:v0.10.0

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY gitconfig /home/atlantis/.gitconfig
RUN chown atlantis /home/atlantis/.gitconfig


# copy a terraform binary of the version you need and validate checksum
RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.7/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.18 \
  && echo "3a45138e77fb41e0884b9491c67dcdeacd06418cd10a1e16ea0cc03976f1b288  /usr/local/bin/terragrunt-0.18" \
  | sha256sum -c

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.19.23/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.19 \
  && echo "affff017c8a51843c3c0923c38bcf4bdaddbaa8dcb50dd7c089e4e08b0093874  /usr/local/bin/terragrunt-0.19" \
  | sha256sum -c


RUN ln -s /usr/local/bin/terragrunt-0.18 /usr/local/bin/terragrunt

RUN chmod +x /usr/local/bin/terragrunt*

COPY atlantis.yaml /home/atlantis/atlantis.yaml

