FROM debian:stable-20240130
WORKDIR /home/
ADD https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz /home
ADD https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz /home
RUN tar -xvzf /home/graalvm-jdk-21_linux-x64_bin.tar.gz
RUN rm -rf /home/graalvm-jdk-21_linux-x64_bin.tar.gz
RUN mkdir /opt/jdk
RUN mv /home/graalvm-jdk-21.0.2+13.1/* /opt/jdk
ENV JAVA_HOME="/opt/jdk"
ENV PATH=$JAVA_HOME/bin:$PATH
RUN tar -xvzf /home/apache-maven-3.9.6-bin.tar.gz
RUN ls -ltr /home/
RUN mkdir /opt/maven
RUN mv /home/apache-maven-3.9.6/* /opt/maven
ENV M2_HOME="/opt/maven"
ENV MAVEN_HOME="/opt/maven"
ENV PATH=${M2_HOME}/bin:${PATH}
RUN java -version
