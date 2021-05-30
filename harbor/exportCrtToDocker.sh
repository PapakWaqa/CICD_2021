#/bin/bash

#建立 docker 放置憑證的目錄
sudo mkdir -p /etc/docker/certs.d/$IP:443

#匯入憑證
sudo cp keys/$IP.cert /etc/docker/certs.d/$IP:443
sudo cp keys/$IP.key /etc/docker/certs.d/$IP:443
sudo cp keys/ca.crt /etc/docker/certs.d/$IP:443

#檢查是否有憑證和私鑰
sudo ls -alh /etc/docker/certs.d/$IP:443

