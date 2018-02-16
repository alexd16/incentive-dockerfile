FROM onuruyar/ruby-1.8.7-rails-ready:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common libmysqlclient-dev && add-apt-repository -y ppa:webupd8team/java && apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer
ENV JAVA_HOME /usr/bin/java

# Instructions to update openssl from https://www.linuxhelp.com/how-to-install-and-update-openssl-on-ubuntu-16-04/.
# Need to fix upload to s3 using paperclip gem
RUN cd /usr/src && \
  wget https://www.openssl.org/source/openssl-1.0.2n.tar.gz && tar -zxf openssl-1.0.2n.tar.gz && \
  cd openssl-1.0.2n && \
  ./config && \
  make && \
  make test && \
  make install && \
  mv /usr/bin/openssl /root/ && \
  ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl

CMD openssl version
