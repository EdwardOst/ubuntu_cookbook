CATALINA_BASE=${CATALINA_HOME}
sudo mkdir -p ${CATALINA_BASE}/work
sudo mkdir -p ${CATALINA_BASE}/conf/policy.d
sudo ln -s ${CATALINA_BASE}/conf/catalina.policy ${CATALINA_BASE}/conf/policy.d/catalina.policy
sudo chown tomcat7:tomcat7 ${CATALINA_BASE}/work
sudo chown tomcat7:tomcat7 ${CATALINA_BASE}/conf/policy.d
sudo chown -h tomcat7:tomcat7 ${CATALINA_BASE}/conf/policy.d/catalina.policy

#TODO: need to use sed with this
#sudo tee -a /opt/tomcat7/conf/tomcat-users.xml <<EOF
#<user username="admin" password="admin" roles="manager-gui,admin-gui"/>
#EOF
