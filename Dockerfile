FROM runatlantis/atlantis:v0.5.0

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

RUN su - atlantis -c 'git config --global credential.helper "/usr/local/bin/credentials.sh"'

RUN su - atlantis -c 'git config --global url."https://".insteadOf git://'


