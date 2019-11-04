FROM gitpod/workspace-full

# Install SBT and prep Scala env
USER root

# Env variables
ENV SCALA_VERSION 2.13.0
ENV SBT_VERSION 1.2.8

#RUN
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt

USER gitpod
 ADD ./mksbt.sh ~/bin/mksbt.sh
 ADD ./install_sbt.sh ~/bin/install_sbt.sh
ENV PATH ~/bin:$PATH

# Give back control
USER root