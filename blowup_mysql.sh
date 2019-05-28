#!/bin/bash
brew uninstall mysql
read -p '>>>> Would you like me to search for where mysql is installed or use default? [y/n] ' SEARCH
if [[ "{SEARCH}" == 'y' || "{SEARCH}" == 'Y' || "{SEARCH}" == 'yes' ]]
then
  MYSQL=$(which mysql)
  echo "${MYSQL}"
  sudo ${MYSQL}/support-files/mysql.server stop
  sudo rm ${MYSQL}
  sudo rm -rf ${MYSQL}*
else
  sudo /usr/local/mysql/support-files/mysql.server stop
  sudo rm /usr/local/mysql
  sudo rm -rf /usr/local/mysql*
fi

sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/My*
rm -rf ~/Library/PreferencePanes/My*
sudo rm -rf /Library/Receipts/mysql*
sudo rm -rf /Library/Receipts/MySQL*
sudo rm -rf /private/var/db/receipts/*mysql*
echo ">>> Mysql removed, removing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
echo ">>> Brew removed -- Restart your computer and then re-install brew and mysql (w/brew)"
