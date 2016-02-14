FROM        ubuntu:latest
MAINTAINER  Ian Richardson <ian.richardson@icloud.com>

# Make add-apt-repository available
RUN apt-get -y install software-properties-common
RUN apt-get update

# Install the webupd8team ppa
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Auto accept the Oracle binary license
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Install the latest JDK 8
RUN apt-get -y install oracle-java8-installer
RUN apt-get -y install oracle-java8-unlimited-jce-policy
RUN apt-get -y install oracle-java8-set-default 

CMD ["java", "-version"]