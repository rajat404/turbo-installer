#! /bin/bash

# Disable shopping suggestions
# http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

sudo add-apt-repository -y ppa:webupd8team/nemo
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:keithw/mosh
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:yannubuntu/boot-repair
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:saiarcot895/myppa
sudo add-apt-repository ppa:webupd8team/sublime-text-3

sudo apt-get -y update && sudo apt-get -y dist-upgrade
xargs sudo apt-get install -y < apt-requirements.txt

# can break the loop, thus kept separate
sudo apt-get install -y flashplugin-installer

sudo pip install -r pip-requirements.txt --upgrade

echo "setting GOPATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Install hf --a fuzzy file finder
go get -u github.com/hugows/hf

echo "Re-updating and cleaning up"
sudo apt-get -y update && sudo apt-get -y autoremove