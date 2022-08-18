# Training VMs

This repository hosts the required files to create a VM-based training environment with [Vagrant](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/).

## Prerequisites

* Enough hardware for 4 VMs
* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)


## Create VMs

Clone this repository and change into the created directory.

```bash
git clone https://github.com/dirkcaumueller/training-vms.git
```

Create an ed25519 SSH key.

```bash
ssh-keygen -t ed25519 -C "vagrant"
```

Run Vagrant command to create VMs and wait for command to finish.

```bash
vagrant up
```

> You can customize the `Vagrantfile` to your needs, e.g. add another VM or raise CPU cores / RAM values.


## Usage

SSH into the VMs with the username `vagrant` and the SSH key.

```bash
ssh -i ./id_ed25519 vagrant@server[0-3]
```


## License

MIT


## Author Information

Authors:

* Dirk Aumueller
