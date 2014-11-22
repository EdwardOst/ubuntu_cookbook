set -x
#
# to capture in log file uncomment set-x and redirect with command shown below
#
# ./install_tomcat.sh > install_tomcat.sh.log 2>&1

owner=eost
tomcat_account=tomcat7
tomcat_version=7.0.56
tomcat_root=apache-tomcat-${tomcat_version}
tomcat_dir_root=/opt
tomcat_dir=${tomcat_dir_root}/${tomcat_root}
tomcat_zipfile=${tomcat_root}.tar.gz
tomcat_url=http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/${tomcat_zipfile}

# add tomcat service account belonging to the nobody group,
# with the /sbin/nologin/ shell and a locked password.
sudo useradd -r -s /usr/sbin/nologin ${tomcat_account}

tempdir=`mktemp -d --tmpdir=.`
wget -P${tempdir} ${tomcat_url}

sudo mkdir ${tomcat_dir}
sudo chown ${owner}:${owner} ${tomcat_dir}
tar xzf ${tempdir}/${tomcat_zipfile} --directory ${tomcat_dir_root}

sudo tee /etc/profile.d/tomcat.sh <<EOF
export CATALINA_HOME=${tomcat_dir}
export PATH=\${PATH}:${tomcat_dir}/bin
EOF

rm ${tempdir}/${tomcat_zipfile}
rmdir ${tempdir}
sudo chown -R ${tomcat_account}:${tomcat_account} ${tomcat_dir}
sudo ln -s ${tomcat_dir} ${tomcat_dir_root}/tomcat
sudo chown -h ${tomcat_account}:${tomcat_account} ${tomcat_dir_root}/tomcat
