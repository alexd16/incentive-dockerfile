FROM onuruyar/ruby-1.8.7-rails-ready:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y python-software-properties software-properties-common && add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y libmysqlclient-dev oracle-java8-installer
ENV JAVA_HOME /usr/bin/java
