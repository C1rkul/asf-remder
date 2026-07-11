#!/bin/sh
set -x

echo "=== Creating configs ==="
mkdir -p /app/config

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
  "GamesPlayedWhileIdle": [4162040],
  "MachineName": "MaxwellTheCat",
  "SteamLogin": "${ASF_STEAM_LOGIN}",
  "SteamPassword": "${ASF_STEAM_PASSWORD}"
}
EOF

cat > /app/config/IPC.config <<EOF
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
ls -la /app/config/

echo "=== Starting ASF ==="
exec /asf/ArchiSteamFarm --no-restart
