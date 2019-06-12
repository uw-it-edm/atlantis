FROM runatlantis/atlantis:v0.8.2

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY gitconfig /home/atlantis/.gitconfig
RUN chown atlantis /home/atlantis/.gitconfig


# copy a terraform binary of the version you need
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.7/terragrunt_linux_386 /usr/local/bin/terragrunt-0.18
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.19.2/terragrunt_linux_386 /usr/local/bin/terragrunt-0.19

RUN ln -s /usr/local/bin/terragrunt-0.18 /usr/local/bin/terragrunt

RUN chmod +x /usr/local/bin/terragrunt*

COPY atlantis.yaml /home/atlantis/atlantis.yaml

