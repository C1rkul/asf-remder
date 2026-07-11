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
  "SteamLogin": "${ASF_STEAM_LOGIN}",
  "SteamPassword": "${ASF_STEAM_PASSWORD}",
  "GamesPlayedWhileIdle": [4162040]
}
EOF

# Копируем IPC.config если нужен
# cp /app/config/IPC.config /asf/config/IPC.config 2>/dev/null || true

echo "=== Starting ASF ==="
exec /asf/ArchiSteamFarm --no-restart