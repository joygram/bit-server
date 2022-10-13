#!/usr/bin/bash
if [ ! -d /home/bit-server ]; then
	echo == git clone == 
	sudo -u shiny git clone https://github.com/joygram/bit-server.git /home/bit-server
else 
	echo == git repository update ==
	pushd .
	cd /home/bit-server
	sudo -u shiny git reset HEAD^ --hard
	sudo -u shiny git pull 
	popd 
fi

# initialize workspace template
TEMPLATE_PATH=/home/bit-server/scripts/workspace_template
WORKSPACE_PATH=/home/bit-server/worksapce
if [[ ! -d "$WORKSPACE_PATH/html" ]]; then
	cp -R $TEMPLATE_PATH/html $WORKSPACE_PATH
fi 

if [[ ! -d "$WORKSPACE_PATH/conf" ]]; then
	cp -R $TEMPLATE_PATH/conf $WORKSPACE_PATH
fi 
