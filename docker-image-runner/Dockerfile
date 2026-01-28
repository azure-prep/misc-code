FROM              docker.io/redhat/ubi9
RUN               curl -L -o /etc/yum.repos.d/hashi.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN               curl -o /etc/yum.repos.d/docker.repo https://download.docker.com/linux/rhel/docker-ce.repo
RUN               dnf install libicu make terraform azure-cli docker-ce-cli unzip -y

RUN adduser github

WORKDIR /home/github

COPY main.sh .
RUN chmod +x main.sh

RUN curl -L -o actions-runner-linux-x64-2.331.0.tar.gz \
    https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz \
    && tar xzf actions-runner-linux-x64-2.331.0.tar.gz \
    && rm actions-runner-linux-x64-2.331.0.tar.gz

RUN chown -R github:github /home/github

USER github

ENTRYPOINT ["./main.sh"]
