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

6. Set Domoticz to start on boot

The way the documentation describes is pretty complicated, this works too.

Create a script in `/etc/init.d`.

```
#!/bin/bash

# Absolute path to the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Command to start domoticz
start_command="sudo /etc/init.d/domoticz.sh start"

# Execute the command
eval "$start_command"

```
