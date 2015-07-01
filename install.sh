#! /bin/bash

# Disable shopping suggestions
# http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

sudo add-apt-repository -y ppa:webupd8team/nemo
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:keithw/mosh
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:yannubuntu/boot-repair

sudo apt-get -y update && sudo apt-get -y dist-upgrade

xargs sudo apt-get install -y < apt-requirements.txt

sudo pip install -r pip-requirements.txt --upgrade

echo "Downloading sublime-text3"
FILE=`mktemp`
URL=`python latest_sublime_dl.py`
wget $URL -O $FILE
echo "Installing sublime text"
sudo dpkg -i $FILE