FROM runatlantis/atlantis:v0.9.0

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY gitconfig /home/atlantis/.gitconfig
RUN chown atlantis /home/atlantis/.gitconfig


# copy a terraform binary of the version you need and validate checksum
RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.7/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.18 \
  && echo "3a45138e77fb41e0884b9491c67dcdeacd06418cd10a1e16ea0cc03976f1b288  /usr/local/bin/terragrunt-0.18" \
  | sha256sum -c

RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v0.19.9/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt-0.19 \
  && echo "9226cffc6b67b48c78e659b8ed1228e41b01c6fa4bd55e26e3b56c4d488db7ea  /usr/local/bin/terragrunt-0.19" \
  | sha256sum -c


RUN ln -s /usr/local/bin/terragrunt-0.18 /usr/local/bin/terragrunt

# TODO, remove once atlantis v0.8.4 is released
RUN ln -s /home/atlantis/.atlantis/bin/terraform0.12.5 /usr/local/bin/terraform0.12.5

RUN chmod +x /usr/local/bin/terragrunt*

COPY atlantis.yaml /home/atlantis/atlantis.yaml

