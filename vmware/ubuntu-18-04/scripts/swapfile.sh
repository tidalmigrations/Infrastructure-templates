echo "++ Disabling swap"
# Disable existing swap
sudo swapoff -a

# Create a swap of 2GB
sudo fallocate -l 2G /swapfile

sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo sed -i '$a/swapfile swap swap defaults 0 0' /etc/fstab

echo "++ Created a new swap"
# Show free memory
sudo free -h
