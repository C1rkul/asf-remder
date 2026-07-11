#!/bin/sh

echo "=== Working directory ==="
pwd

echo "=== Contents of / ==="
ls -la /

echo "=== Contents of /app ==="
ls -la /app/

echo "=== Find ArchiSteamFarm ==="
find / -name "*ArchiSteamFarm*" 2>/dev/null

echo "=== Creating configs ==="
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

echo "=== Starting ASF ==="
exec /app/ArchiSteamFarm --no-restart
