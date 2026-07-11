#!/bin/sh

cat > /app/config/ASF.json <<EOF
{
  "CurrentCulture": "ru-RU",
  "IPCPassword": "${ASF_IPC_PASSWORD}",
  "SteamOwnerID": ${ASF_STEAM_OWNER_ID}
}
EOF

cat > /app/config/first.json <<EOF
{
  "Enabled": true,
  "SteamLogin": "${ASF_STEAM_LOGIN}",
  "SteamPassword": "${ASF_STEAM_PASSWORD}",
  "GamesPlayedWhileIdle": [730]
}
EOF

exec /app/ArchiSteamFarm --no-restart
