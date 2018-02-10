# Create and setup /swapfile as a 4GB swap file 
export SUDO=sudo
free -m
$SUDO swapon -s
free -m
df -h
$SUDO fallocate -l 4G /swapfile
ls -lh /swapfile
$SUDO chmod 600 /swapfile
ls -lh /swapfile
$SUDO mkswap /swapfile
$SUDO swapon /swapfile
$SUDO swapon -s
free -m
# Persist swap file setting across reboots
$SUDO echo '/swapfile	none 		swap 	sw 0 0' >> /etc/fstab

# Change and persist the swappiness setting
$SUDO sysctl vm.swappiness=10
$SUDO sed -i "/^vm.swappiness *= */c vm.swappiness = 10" /etc/sysctl.conf

# Change and persist the VFS inode cache settings
cat /proc/sys/vm/vfs_cache_pressure
$SUDO sysctl vm.vfs_cache_pressure=50
$SUDO sed -i '$a\vm.vfs_cache_pressure = 50' /etc/sysctl.conf
cat /proc/sys/vm/vfs_cache_pressure

# Credits 
# swapon: https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
# sed command usage: https://likegeeks.com/sed-linux/
