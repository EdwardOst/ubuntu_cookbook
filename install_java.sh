set -x
#
# to capture in log file uncomment set-x and redirect with command shown below
#
# ./install_java.sh > install_java.sh.log 2>&1
#
# turn off interactive mode
export DEBIAN_FRONTEND=noninteractive
# allow adding apt repositories
sudo apt-get install -y software-properties-common python-software-properties
# pass variables for headless install of oracle package
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# add apt-get repo for jdk install
sudo -E add-apt-repository ppa:webupd8team/java <<EOF

EOF
sudo -E apt-get update
# install jdk
sudo -E apt-get install -y oracle-java7-installer
# set java 7 environment variables
sudo -E apt-get install -y oracle-java7-set-default
sudo -E apt-get update
