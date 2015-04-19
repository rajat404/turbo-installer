#Turbo Installer
Installs the essential components, after a fresh installation of the OS. Its made with Ubuntu in mind, though should work on other distros with little tinkering.

>This project is inspired from [dumb-jarvis](https://github.com/bhanuvrat/dumb-jarvis) by Anuvrat Parashar and utilizes part of its code.

###Features
It installs ZSH, Prezto and the latest version of Sublime Text.
Apart from that, all the packages to be installed are listed in:

* pip-requirements.txt
* apt-requirements.txt

and the ppa-requirements (if any) for the packages are listed in:

* ppa-requirements.txt

Feel free to change the list of packages as per your needs.

###Usage
```sh
chmod +x install.sh
./install.sh
```
