FROM socrata/runit-java8

ENV JENKINS_ROOT /var/lib/jenkins
RUN mkdir -p $JENKINS_ROOT
WORKDIR $JENKINS_ROOT
RUN wget http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

ENV MASTER_HOST master
ENV MASTER_PORT 8080
ENV WORKER_NAME anonymous_worker

CMD java -jar swarm-client-2.0-jar-with-dependencies.jar \
         -master http://$MASTER_HOST:$MASTER_PORT \
         -executors 3 \
         -name $WORKER_NAME
