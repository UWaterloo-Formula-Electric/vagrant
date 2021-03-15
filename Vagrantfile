# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative "lib/initial_check.rb"
require_relative "lib/usb_filter_handler.rb"

REQUIRED_PLUGINS = %w( vagrant-vbguest )
VAGRANT_API_VERSION = "2"

# Fail if required plugins not installed
InitialCheck.assert_required_plugins_installed(REQUIRED_PLUGINS)

# All Vagrant configuration is done below. 
# Please don't change it unless you know what you're doing.

Vagrant.configure(VAGRANT_API_VERSION) do |config|

  # Ubuntu 18.04 LTS image
  config.vm.box = "ubuntu/bionic64"

  # VirtualBox configuration
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    vb.name = "wfe_dev_environment"
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vbguest.auto_update = true

  # Turn on USB 2.0 support and add USB filter to attach STLink
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
    UsbFilterHandler.add_filter(vb, "0483", "374B", "ST Link Debug Probe", "STM32 STLink")
  end
  
  # Run this script first time VM is booted
  config.vm.provision "shell", path: "bin/install.sh"

  # Run this script every time VM is booted
  config.vm.provision "shell", path: "bin/run_on_startup.sh", run: "always"

  # Configure shared folder
  config.vm.synced_folder "shared", "/home/vagrant/shared",
    :owner => "vagrant",
    :group => "vagrant",
    :mount_options => ["dmode=777", "fmode=777"]

end
