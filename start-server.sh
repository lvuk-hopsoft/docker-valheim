export LD_LIBRARY_PATH=/home/valheim/data/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

cp /home/valheim/data/linux64/steamclient.so /home/valheim/data

echo "### Starting Valheim server ###"

./data/valheim_server.x86_64 \
  -nographics \
  -batchmode \
  -name ${SERVER_NAME} \
  -port ${SERVER_PORT} \
  -world ${SERVER_WORLD} \
  -password ${SERVER_PASSWORD} \
  -savedir ${SAVE_DIR} \
  -public 1

