FROM socrata/runit-java8

# Install Jenkins
RUN wget -q -O - \
    https://jenkins-ci.org/debian/jenkins-ci.org.key | \
      sudo apt-key add - && \
    sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ \
      > /etc/apt/sources.list.d/jenkins.list' && \
    sudo apt-get update -y && \
    sudo apt-get install -y jenkins

ENV JENKINS_HOME /var/lib/jenkins
COPY jenkins $JENKINS_HOME

# Install plugins
RUN sudo -u jenkins wget -P $JENKINS_HOME/plugins http://updates.jenkins-ci.org/latest/swarm.hpi

ENV SERVICE_DIR /etc/service/jenkins
RUN mkdir -p $SERVICE_DIR
COPY runit $SERVICE_DIR

EXPOSE 8080
ENV JAVA_XMX 1024m
ENV JAVA_XMS 256m
