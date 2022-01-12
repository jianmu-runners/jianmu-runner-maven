FROM maven:${maven_image_tag}
RUN apt-get update
RUN apt-get install libxml2-utils -y
COPY file/settings-docker.xml /usr/share/maven/conf/settings.xml
ADD script/mvn_start /usr/local/bin/
