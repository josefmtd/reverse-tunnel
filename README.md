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

Put your SSH private key inside the `key` directory and modify the environment configuration, once you're done, run the install commands
```
$ nano .env
# make install
```

To remove and uninstall the service, use the clean command
```
# make clean
```

## Notes

All keys are stored in `/opt/reverse`
