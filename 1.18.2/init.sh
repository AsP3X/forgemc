#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

echo "Preparing server..."
sleep 1

if [[ "${allowSSH}" == "true" ]]; then
	service ssh start
else
	echo "SSH is disabled"
fi

echo $PWD
sleep 2
if [ ! -f "/server/start.sh" ];
then
  cp -r /serverfiles/* /server
  cp /temp/start.sh /server
  cp /temp/eula.txt /server
  sleep 1
  /server/start.sh
else
	chmod 755 /server/start.sh
	/server/start.sh
fi
