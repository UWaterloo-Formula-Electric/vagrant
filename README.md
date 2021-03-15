# Vagrant Setup

For a more extensive guide, refer to our [Confluence page](https://wiki.uwaterloo.ca/display/FESW/Vagrant+Setup).

## Prerequisites

* Install the latest version of [Vagrant](https://www.vagrantup.com/downloads)
* Install the latest version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install the matching [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) to get USB data

If on Linux, add your user to the `vboxusers` group

```
sudo usermod -a -G vboxusers $USER
```

## Getting Started

Make sure everything under **Prerequisites** is installed. Then, run:

```
git clone git@bitbucket.org:waterloohybrid/vagrant.git && cd vagrant
vagrant up
vagrant reload
```

(This could take a while to complete.)

The commands above only need to be run the first time you set up the VM. Otherwise, the next time you want to work with it, you can just run `vagrant up` from the `vagrant/` directory.

Do not maximize the window when on the login page (for some reason the screen activity freezes). Log in with the username `vagrant` and password `vagrant`. You can maximize the window after logging in.

The `shared/` directory in the VM will be shared between your host operating system and the virtual environment. The location in your operating system is `/<where-you-cloned-this-repo>/shared/`.

To turn off the machine, run `vagrant halt`.

## Installing STM32CubeMX (Optional)

Go [here](https://www.st.com/en/development-tools/stm32cubemx.html#get-software) and click `Get Software` for **Linux** (you will have to make an account). Once you've downloaded the package, unzip it in the `shared/` directory.

Once in the VM, open a terminal and run:

```
cd ~/shared/en.stm32cubemx-lin_v<VERSION>
chmod 777 SetupSTM32CubeMX-<VERSION>
./SetupSTM32CubeMX-<VERSION>
```

(Replace `<VERSION>` with the version number you've downloaded.)

An installation wizard should open. Follow through it until it's finished (accept the terms and use the default installation path).

Now STM32CubeMX is installed, but it would be nice to have a launcher that we can add to the desktop or pin to the taskbar.

Go to this repository's [Downloads](https://bitbucket.org/waterloohybrid/vagrant/downloads/) page and download `stm32cubemx.desktop` and `stm32cubemx.png` to the `shared/` directory.

Then, in a terminal on the VM, run:

```
mv ~/shared/stm32cubemx.png ~/.local/share/applications/
mv ~/shared/stm32cubemx.desktop ~/Desktop/
```

Double click on the `stm32cubemx.desktop` file that's now on your VM desktop. Click "Trust and Launch" on the popup dialog. The application should open and you now have a desktop launcher for STM32CubeMX. However, it won't be listed as an application until you restart your VM with `vagrant reload` in a terminal on your host computer. (Make sure you're in the directory containing the Vagrantfile when running `vagrant` commands.)

## Starting Fresh

If you have the VM set up already but would like to delete it and re-install it, run the following (in the directory containing the Vagrantfile):

```
vagrant destroy
vagrant box remove ubuntu/bionic64
```

This will delete the VM and remove it from the list of machines in VirtualBox. Then, you can just run `vagrant up` again to re-install it.

## Vagrant Commands

Make sure you're in the directory containing the Vagrantfile when running any of the below commands.

Turn on or resume the VM with the command `vagrant up`.

Shut down the VM with the command `vagrant halt`.

Hibernate the VM with the command `vagrant suspend`.

Restart the VM with the command `vagrant reload`.

SSH to the VM with the command `vagrant ssh`. To exit the SSH session, run `exit` or `logout`. (Exiting the session does **not** shut down the VM!)

Delete the VM with the command `vagrant destroy`. Use this when you want to start fresh again.

For an extensive list of all Vagrant commands, run `vagrant help`.
