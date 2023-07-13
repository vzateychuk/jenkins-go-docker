FROM jenkins/jenkins:2.401.2-jdk17

USER root

RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli wget nano curl -y

# Install Go
RUN wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz  
RUN  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.6.linux-amd64.tar.gz
# Configure Go
ENV GOROOT /usr/local/go
ENV GOPATH /var/jenkins_home/go
ENV PATH $GOROOT/bin:$PATH

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"