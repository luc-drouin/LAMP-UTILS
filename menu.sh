#!/bin/bash
#
# AUTHOR: LUC P. DROUIN
#
# KEYWORDS: LINUX ARCH MANJARO APACHE MARIADB POSTGRESQL LAMP
#
# MODULE: menu.sh
#
# PURPOSE: Menu system to control web server and databases
#          in LAMP development system.
#
# UPDATED: 24 JULY 2017

RED='\033[0;41;30m'
NRM='\033[0;0;39m'
 
pause() {
	read -p "Press [Enter] key to continue..."
}

StopWebServer() {
	sudo systemctl stop httpd
	pause
}
 
StartWebServer() {
	sudo systemctl start httpd
	pause
}

WebServerStatus() {
	sudo systemctl status httpd
	pause
}

StopMariaDB() {
	sudo systemctl stop mysqld
	pause
}
 
StartMariaDB() {
	sudo systemctl start mysqld
	pause
}

MariaDBStatus() {
	sudo systemctl status mysqld
	pause
}

StopPostgresql() {
	sudo systemctl stop postgresql
	pause
}
 
StartPostgresql() {
	sudo systemctl start postgresql
	pause
}

PostgresqlStatus() {
	sudo systemctl status postgresql
	pause
}
 
show_menu() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " SYSTEM CONTROL MENU "
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo ""
	date
	echo ""
	echo "1. Stop Apache Web Server"
	echo "2. Start Apache Web Server"
	echo "3. Apache Web Server Status"
	echo "4. Stop MariaDB Database"
	echo "5. Start MariaDB Database"
	echo "6. MariaDB Database Status"
	echo "7. Stop Postgresql Database"
	echo "8. Start Postgresql Database"
	echo "9. Postgresql Database Status"	
	echo "0. Exit"
}

read_option() {
	local choice
	echo ""
	read -p "Enter choice: " choice
	case $choice in
		1) StopWebServer ;;
		2) StartWebServer ;;
		3) WebServerStatus ;;
		4) StopMariaDB ;;
		5) StartMariaDB ;;
		6) MariaDBStatus ;;
		7) StopPostgresql ;;
		8) StartPostgresql ;;
		9) PostgresqlStatus ;;
		a) zenity --list --checklist --column "Buy" --column "Item" TRUE Guns TRUE Grenades FALSE Incendiaries FALSE Guided Missiles ;;
		0) exit 0 ;;
		*) echo -e "${RED}Error...${NRM}" && sleep 3
	esac
}

# Trap CTRL+C, CTRL+Z and QUIT
trap '' SIGINT SIGQUIT SIGTSTP
 
# MAIN - Loop Forerver
while true
do
	show_menu
	read_option
done
