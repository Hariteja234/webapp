FROM maven as build stage
RUN mkdir /opt/hari
WORKDIR /opt/hari
COPY /var/lib/jenkins/workspace/cicd/my-webapp /opt/hari
RUN mvn clean install

##tomcat deploy stage
FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/hari/target/*.war
RUN rm -rf  && mv *.war ROOT.war
EXPOSE 8088
