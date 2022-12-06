echo "++ Disabling the existing swap"
sudo swapoff -a

echo "++ Creating a swap of 2GB"
sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo sed -i '$a/swapfile swap swap defaults 0 0' /etc/fstab

echo "++ Showing a free memory after adding swap"
sudo free -h
