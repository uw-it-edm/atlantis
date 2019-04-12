FROM runatlantis/atlantis:v0.7.1

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY gitconfig /home/atlantis/.gitconfig
RUN chown atlantis /home/atlantis/.gitconfig


# copy a terraform binary of the version you need
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.3/terragrunt_linux_386 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt

COPY atlantis.yaml /home/atlantis/atlantis.yaml

