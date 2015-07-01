#! /bin/bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i 's/in.archive.ubuntu.com/mirror.dhakacom.com/' /etc/apt/sources.list

# Disable shopping suggestions
# http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

xargs sudo add-apt-repository -y < ppa-requirements.txt
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install -y boot-repair

xargs sudo apt-get install -y < apt-requirements.txt

sudo pip install -r pip-requirements.txt --upgrade

echo "Downloading sublime-text3"
FILE=`mktemp`
URL=`python latest_sublime_dl.py`
wget $URL -O $FILE
echo "Installing sublime text"
sudo dpkg -i $FILE

# To start ZSH shell
zsh
echo "Setting up Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh