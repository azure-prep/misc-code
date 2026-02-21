FROM              docker.io/redhat/ubi9
RUN               curl -L -o /etc/yum.repos.d/hashi.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN               curl -o /etc/yum.repos.d/docker.repo https://download.docker.com/linux/rhel/docker-ce.repo
RUN               dnf install https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm -y
RUN               dnf install libicu make terraform azure-cli docker-ce-cli unzip -y
RUN               curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /bin/kubectl && chmod +x /bin/kubectl
RUN               adduser github
WORKDIR           /home/github
COPY              main.sh .
RUN               chmod +x main.sh
RUN               curl -L -o actions-runner-linux-x64-2.331.0.tar.gz \
                   https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz \
                   && tar xzf actions-runner-linux-x64-2.331.0.tar.gz \
                   && rm actions-runner-linux-x64-2.331.0.tar.gz \
RUN               curl -L -o sonar-scanner-cli-7.1.0.4889-linux-x64.zip "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.1.0.4889-linux-x64.zip?_gl=1*1aqu2g8*_gcl_au*MTgxMzM0NDY3NC4xNzU0MDA5MTU1*_ga*MTM4MTA5NDI5Ni4xNzU0MDA5MTU1*_ga_9JZ0GZ5TC6*czE3NTQwMDkxNTQkbzEkZzEkdDE3NTQwMDk4NzAkajU5JGwwJGgw" && unzip sonar-scanner-cli-7.1.0.4889-linux-x64.zip && rm -f sonar-scanner-cli-7.1.0.4889-linux-x64.zip
RUN               chown -R github:github /home/github
USER              github
ENTRYPOINT        ["./main.sh"]
