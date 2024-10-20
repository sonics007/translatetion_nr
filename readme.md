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






[![PayPal Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/donate/?hosted_button_id=74TKTK2NWCKSY)


<form action="https://www.paypal.com/donate" method="post" target="_top">
<input type="hidden" name="hosted_button_id" value="74TKTK2NWCKSY" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_SK/i/scr/pixel.gif" width="1" height="1" />
</form>
