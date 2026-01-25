FROM redhat/ubi9

RUN dnf install -y libicu curl tar \
    && dnf clean all

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
