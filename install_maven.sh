set -x
#
# to capture in log file uncomment set-x and redirect with command shown below
#
# ./install_maven.sh > install_maven.sh.log 2>&1

owner=eost
maven_version=3.2.3
maven_root=apache-maven-${maven_version}
maven_dir_root=/opt
maven_dir=${maven_dir_root}/${maven_root}
maven_zipfile=${maven_root}-bin.tar.gz
maven_url=http://archive.apache.org/dist/maven/maven-3/3.2.3/binaries/${maven_zipfile}

tempdir=`mktemp -d --tmpdir=.`
wget -P${tempdir} ${maven_url}

sudo mkdir -p ${maven_dir}
sudo chown ${owner}:${owner} ${maven_dir}
tar xzf ${tempdir}/${maven_zipfile} --directory ${maven_dir_root}

sudo tee /etc/profile.d/maven.sh <<EOF
export M2_HOME=${maven_dir}
export PATH=\${PATH}:${maven_dir}/bin
EOF

rm ${tempdir}/${maven_zipfile}
rmdir ${tempdir}
