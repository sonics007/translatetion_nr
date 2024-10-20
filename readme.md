Tento skript kopíruje slovenske preklady do Node-red
Node-red musi byt nainštalovany  cez 
bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered).
Ako naištalovat Node-red si prečitaj tu https://nodered.org/docs/getting-started/raspberrypi.
1. stiahnutie skriptu:
   curl -o translation.sh https://raw.githubusercontent.com/sonics007/translatetion_nr/main/translation.sh
   alebo
   wget -O translation.sh https://raw.githubusercontent.com/sonics007/translatetion_nr/main/translation.sh
2. Nastavte správne oprávnenia pre skript:
   chmod +x translation.sh
3. spustenie skriptu:
   sudo ./translation-nr.sh

Čo všetko je preložene
  a)  Node red
  b)  Home assistant websocket
      https://flows.nodered.org/node/node-red-contrib-home-assistant-websocket
      -tu je preložena iba zakladná časť developer to musi este upravit 
       aby bolo možne preložit komplet
  c)  Zigbee2mqtt
      -https://flows.nodered.org/node/node-red-contrib-zigbee2mqtt 
