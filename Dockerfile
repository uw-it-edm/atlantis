FROM runatlantis/atlantis:v0.5.0

COPY credentials.sh /usr/local/bin/credentials.sh
RUN chmod +x /usr/local/bin/credentials.sh

COPY gitconfig /home/atlantis/.gitconfig
RUN chown atlantis /home/atlantis/.gitconfig

