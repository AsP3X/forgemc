#!/bin/bash
####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 15.03.2022 11:10 | #202203151110                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

# echo "###############################################"
# echo "###############################################"
# echo "       Warning this build is deprecated        "
# echo "  and will no longer be updated and supported  "
# echo "                                               "
# echo "     Do not under ANY CIRCUMSTANCES use it     "
# echo "     for production or anything else exept     "
# echo "       testing and private purposes only       "
# echo "###############################################"
# echo "###############################################"

sleep 4

if [[ "${RAM}" < "6G" ]]; then
  echo "RAM is less than 6G"
  echo "Please set RAM to at least 6G"
  sleep 5
  exit 0
fi

if [[ "${RAM}" ]]; then
  rm -rf /server/user_jvm_args.txt
  touch /server/user_jvm_args.txt
	echo "Using ${RAM}"
  echo "-Xmx${RAM} -Xms${RAM}" >> /server/user_jvm_args.txt
else
	echo "Set ram to default of 6G"
	echo "This can be changed later"
	RAM=6G
  touch /server/user_jvm_args.txt
	echo "Using ${RAM}"
  echo "-Xmx${RAM} -Xms${RAM}" >> /server/user_jvm_args.txt
fi
sleep 1

# get the full filename of the forge jar file and remove the .jar extension
FULLFILENAME=`ls -1 /server/forge*.jar | tail -n 1`
echo "Using ${FULLFILENAME}"
cp /temp/eula.txt /server/eula.txt

SERVERFILE=/server/run.sh
if test -f "$SERVERFILE"; then
  echo "Starting server..."
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar ${FULLFILENAME}"
  # screen -S Minecraft-Server /bin/sh -c "/server/run.sh"
else
  echo "Creating new Files"
	sleep 1
	screen -S Minecraft-Server /bin/sh -c "java -Xmx${RAM} -Xms${RAM} -jar ${FULLFILENAME}"
  # screen -S Minecraft-Server /bin/sh -c "/server/run.sh"
fi
