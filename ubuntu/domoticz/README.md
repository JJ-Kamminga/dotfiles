# Domoticz

## How to install

How to install domoticz on a dedicated machine.

1. Create new user:
```
sudo adduser domoticz
```

2. Give user ownership of drive or partition where domoticz will be installed, or just the folder.

```
chown domoticz path/to/folder
```

3. Remove SSH access from root.

Open file `/etc/ssh/sshd_config` and add this line: `DenyUsers root`

4. Become domoticz

```
su domoticz
```

5. Install domoticz
```
 sudo bash -c "$(curl -sSfL https://install.domoticz.com)" 
```
Make sure to install it on an SSD or HDD, not SD card. Large amounts of disk activity will quickly wear out an SD card.
