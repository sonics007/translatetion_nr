#!/bin/bash

# Funkcia na kontrolu a inštaláciu Gitu
check_and_install_git() {
    if ! command -v git &> /dev/null; then
        echo "Git nie je nainštalovaný. Inštalujem Git..."
        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y git
        elif command -v yum &> /dev/null; then
            sudo yum install -y git
        else
            echo "Nepodarilo sa nainštalovať Git. Prosím, nainštalujte ho manuálne."
            exit 1
        fi
    fi
}

# Funkcia na reštart Node-RED
restart_node_red() {
    echo "Pokúšam sa reštartovať Node-RED..."
    
    if systemctl is-active --quiet nodered.service; then
        sudo systemctl restart nodered.service
        echo "Node-RED reštartovaný pomocou systemctl."
        return
    fi
    
    if command -v node-red-restart &> /dev/null; then
        node-red-restart
        echo "Node-RED reštartovaný pomocou node-red-restart príkazu."
        return
    fi
    
    pid=$(pgrep -f "node-red")
    if [ ! -z "$pid" ]; then
        kill $pid
        sleep 2
        nohup node-red > /dev/null 2>&1 &
        echo "Node-RED reštartovaný manuálne ukončením a opätovným spustením procesu."
        return
    fi
    
    echo "Nepodarilo sa reštartovať Node-RED. Prosím, reštartujte ho manuálne."
}

# Kontrola a inštalácia Gitu
check_and_install_git

# Nastavenie ciest k cieľovým adresárom
target_dir1="/root/.node-red/node_modules/node-red-contrib-zigbee2mqtt/nodes/locales"
target_dir2="/root/.node-red/node_modules/node-red-contrib-home-assistant-websocket/dist/locales"
target_dir3="/usr/lib/node_modules/node-red/node_modules/@node-red/editor-client/locales"
target_dir4="/usr/lib/node_modules/node-red/node_modules/@node-red/nodes/locales"
target_dir5="/usr/lib/node_modules/node-red/node_modules/@node-red/runtime/locales"

# Vytvorenie dočasného adresára
temp_dir=$(mktemp -d)

# Stiahnutie repozitárov z GitHubu
git clone https://github.com/sonics007/node-red-contrib-zigbee2mqtt.git "$temp_dir/zigbee2mqtt"
git clone https://github.com/sonics007/node-red-contrib-home-assistant-websocket.git "$temp_dir/home-assistant"
git clone https://github.com/sonics007/node-red.git "$temp_dir/node-red"

# Skopírovanie zložiek do cieľových adresárov
cp -r "$temp_dir/zigbee2mqtt/nodes/locales/sk-SK" "$target_dir1"
cp -r "$temp_dir/home-assistant/locales/sk-SK" "$target_dir2"
cp -r "$temp_dir/node-red/packages/node_modules/@node-red/editor-client/locales/en-US" "$target_dir3"
cp -r "$temp_dir/node-red/packages/node_modules/@node-red/editor-client/locales/sk-SK" "$target_dir3"
cp -r "$temp_dir/node-red/packages/node_modules/@node-red/nodes/locales/sk-SK" "$target_dir4"
cp -r "$temp_dir/node-red/packages/node_modules/@node-red/runtime/locales/sk-SK" "$target_dir5"

# Vymazanie dočasného adresára
rm -rf "$temp_dir"

echo "Zložky boli úspešne skopírované do príslušných cieľových adresárov."

# Reštart Node-RED
restart_node_red