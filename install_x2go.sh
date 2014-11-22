export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get update
sudo add-apt-repository -y ppa:x2go/stable 
sudo apt-get update
sudo apt-get install -y x2goserver x2goserver-xsession
