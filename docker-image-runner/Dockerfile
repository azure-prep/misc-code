FROM redhat/ubi9
RUN adduser github
USER github
WORKDIR /home/github
RUN curl -o actions-runner-linux-x64-2.331.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.331.0.tar.gz
