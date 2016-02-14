FROM        ubuntu:latest
MAINTAINER  Ian Richardson <ian.richardson@icloud.com>

# Add the WebUpd8 team PPA an
RUN apt-get -y install software-properties-common \ 
        && apt-get update \
        && add-apt-repository -y ppa:webupd8team/java \
        && apt-get update

# Install the latest JDK 8
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
        && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
        && apt-get -y install oracle-java8-installer \ 
                oracle-java8-unlimited-jce-policy \ 
                oracle-java8-set-default 

CMD ["java", "-version"]