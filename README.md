# reverse-tunnel
Reverse Tunnel SSH Service

## Introduction

This systemd service will provide a reverse SSH tunnel to remotely access
Raspberry Pi through a known remote server.

Requirements:
1. Linux Server with SSH login

## Installation

Clone this repository, install git first if the Pi does not have git.

```
# apt update
# apt install git
$ git clone https://github.com/josefmtd/reverse-tunnel
```

Change to the reverse-tunnel directory
```
$ cd reverse-tunnel
```

Copy the SSH key to ./key and make sure it's not readable by everyone
```
$ cp /PATH/TO/KEY ./key/KEY_NAME
$ chmod 400 ./key/KEY_NAME
```

Put in the server credentials in ssh.conf
```
$ nano ssh.conf
```

Use the install script to install
```
# ./install.sh
```

Reboot the Raspberry Pi
```
# reboot
```
