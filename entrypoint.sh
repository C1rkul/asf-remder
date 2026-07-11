#!/bin/sh

echo "=== Creating configs ==="
mkdir -p /asf/config

cat > /asf/config/ASF.json <<EOF
{
  "CurrentCulture": "ru-RU",
  "IPCPassword": "${ASF_IPC_PASSWORD}",
  "SteamOwnerID": ${ASF_STEAM_OWNER_ID}
}
EOF

cat > /asf/config/first.json <<EOF
{
  "Enabled": true,
  "GamesPlayedWhileIdle": [4162040],
  "MachineName": "MaxwellTheCat",
  "SteamLogin": "${ASF_STEAM_LOGIN}",
  "SteamPassword": "${ASF_STEAM_PASSWORD}"
}
EOF

cat > /asf/config/IPC.config <<EOF
{
  "Kestrel": {
    "Endpoints": {
      "HTTP": {
        "Url": "http://0.0.0.0:1242"
      }
    }
  }
}
EOF

echo "=== Config files ==="
ls -la /asf/config/

echo "=== Starting ASF ==="
exec /asf/ArchiSteamFarm --no-restart