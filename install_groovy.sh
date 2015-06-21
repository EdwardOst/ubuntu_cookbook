set -x
#
# to capture in log file uncomment set-x and redirect with command shown below
#
# ./install_groovy.sh > install_groovy.sh.log 2>&1

owner=eost
groovy_version=2.4.3
groovy_root=groovy-${groovy_version}
groovy_dir_root=/opt
groovy_dir=${groovy_dir_root}/${groovy_root}
groovy_zipfile=groovy-binary-${groovy_version}.zip
groovy_url=http://dl.bintray.com/groovy/maven/${groovy_zipfile}

echo "test"

tempdir=`mktemp -d --tmpdir=.`
wget -P${tempdir} ${groovy_url}

sudo mkdir -p ${groovy_dir}
sudo chown ${owner}:${owner} ${groovy_dir}
unzip ${tempdir}/${groovy_zipfile} -directory ${groovy_dir_root}

sudo tee /etc/profile.d/groovy.sh <<EOF
export GROOVY_HOME=${groovy_dir}
export PATH=\${PATH}:${groovy_dir}/bin
EOF

rm ${tempdir}/${groovy_zipfile}
rmdir ${tempdir}
