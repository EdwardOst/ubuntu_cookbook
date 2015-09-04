set -x
#
# to capture in log file uncomment set-x and redirect with command shown below
#
# ./install_ant.sh > install_ant.sh.log 2>&1

owner=eost
ant_version=1.9.4
ant_root=apache-ant-${ant_version}
ant_dir_root=/opt
ant_dir=${ant_dir_root}/${ant_root}
ant_zipfile=${ant_root}-bin.tar.gz
ant_url=http://archive.apache.org/dist/ant/binaries/${ant_zipfile}

echo "test"

tempdir=`mktemp -d --tmpdir=.`
wget -P${tempdir} ${ant_url}

sudo mkdir -p ${ant_dir}
sudo chown ${owner}:${owner} ${ant_dir}
tar xzf ${tempdir}/${ant_zipfile} --directory ${ant_dir_root}

sudo tee /etc/profile.d/ant.sh <<EOF
export ANT_HOME=${ant_dir}
export PATH=\${PATH}:${ant_dir}/bin
EOF
source /etc/profile.d/ant.sh

rm ${tempdir}/${ant_zipfile}
rmdir ${tempdir}
