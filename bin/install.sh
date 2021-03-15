# Update repositories
sudo apt-get update -y

# Upgrade installed packages
sudo apt upgrade -y

# Add extra modules
sudo apt-get install -y linux-modules-extra-$(uname -r)

# Add desktop environment
sudo apt install -y --no-install-recommends ubuntu-desktop
sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# Add `vagrant` to Administrator
sudo usermod -a -G sudo vagrant

# Add Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub|sudo apt-key add -
sudo sh -c "echo \"deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main\" > /etc/apt/sources.list.d/google.list"
sudo apt install -y google-chrome-stable

# Add Chromium
sudo apt install -y chromium-browser

# Add Python 3, Pip, IDLE, Python packages
sudo apt-get install -y python3 python3-pip idle3
pip3 install cantools python-can pyside2

# Add Qt 5 for GUI work
sudo apt-get install -y qt5-default

# Add CAN utilities
sudo apt-get install -y can-utils

# Add OpenOCD and GNU Arm Embedded Toolchain
sudo apt-get install -y openocd gcc-arm-none-eabi

# Install text editor
sudo apt-get install -y gedit

# Add USB permissions for ST Link and reload udev rules
cat << EOF > /etc/udev/rules.d/50-myusb.rules
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", GROUP="users", MODE="0666"
EOF
sudo udevadm control --reload
