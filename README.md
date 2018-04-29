# rtl8814AU
Realtek 8814AU USB WiFi driver.

Forked from [Diederik de Haas](https://github.com/diederikdehaas/rtl8814AU)'
repository which is based on version 4.3.21 of an Edimax driver for the
EW-7833UAC device.

Updated with support for kernels >= 4.14.

# DKMS support

From your src dir

````
sudo cp -R . /usr/src/rtl8814au-4.3.21
sudo dkms build -m rtl8814au -v 4.3.21
sudo dkms install -m rtl8814au -v 4.3.21
````

This should keep your 8814AU adapter working post kernel updates.


## n3dst4 fork

Forking this to add some notes...

* Updating Ubuntu caused this module to stop working, which is an ass.
* Repeating the instructions above lead to messages that the module was already built/installed
* `sudo modprobe 8814au` -> something about exec format errors?
* `dmesg|grep 8814` -> errors about kernel magic being wrong??

Things I did that may have fixed it:

* `make clean`
* `make`
* `sudo dkms remove rtl8814au/4.3.21 --all`
* `sudo dkms build -m rtl8814au -v 4.3.21`
* `sudo dkms install -m rtl8814au -v 4.3.21`

### Update 1

* And reboot (there may be a better way to kickstart it but reboot definitely works).


### Update 2

By experimentation, I've established that having done the `make` steps above once, it's sufficient to just do:

* `sudo dkms remove rtl8814au/4.3.21 --all`
* `sudo dkms install -m rtl8814au -v 4.3.21`

to re-establish the driver if it gets clunked by updates.
