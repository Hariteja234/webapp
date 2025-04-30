# Use official Tomcat base image
FROM tomcat:9.0

# Remove default webapps to keep it clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to ROOT.war in Tomcat
COPY target/my-webapp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose default Tomcat port
EXPOSE 8088

# Start Tomcat server
CMD ["catalina.sh", "run"]

