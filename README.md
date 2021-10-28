# o8t
# Omniscient DevOps test

`Omniscient-DevOps` This project will create a new VPC and other componets included in it susch as NAT, Gateway and subnets for private and public. We will also be able to provision an EC2 for public web access on port 80.
Additionaly we will provision another EC2 in a private subnet that will make call to the public facing EC2 this to ensure that the public facing EC2 is up and running this will be done via bash script that will check the health each 5 min. 
There will be a configuration to change the time it will run.
The provisioning is done via terraform for AWS and the server configuration will be done via ansible. We will run the webservice in docker container running in the EC2.
There will also be some configuration for the Security-groups to allow network traffic from outside to the web application.

Location for log file on healt-check server path: /var/log/web-app/logs.txt

:)
Contents
========

 * [Why?](#why)
 * [Prerequisite](#prerequisite)
 * [Usage](#usage)


### Why?

This is the demonstrate the skills necesery to be able to provision and work with AWS, terraform and Ansible.

+ Back up dotfiles _from where they live on the system_.
+ Back up files from _any_ path on the system, not just `$HOME`.

### Prerequisite
---

We will need to install this package for us to run the provisioning:

1. Install terraform
# tfenv

[Terraform](https://www.terraform.io/) version manager inspired by [rbenv](https://github.com/rbenv/rbenv)

## Support

Currently tfenv supports the following OSes

- Mac OS X (64bit)
- Linux
  - 64bit
  - Arm
- Windows (64bit) - only tested in git-bash - currently presumed failing due to symlink issues in git-bash

## Installation

### Automatic

Install via Homebrew

```console
$ brew install tfenv
```

2. Install aws cli 

Install via snap 

```console
$ sudo snap install aws-cli --classic
```

Install via Homebrew

```console
$ brew install awscli
```

2. Install ansible 

Install via pacman (Arch) 

```console
$ sudo pacman -S ansible
```

Install via Homebrew

```console
$ brew install ansible
```

### Usage
---

To start the aws provisioning, simply run `$ terraform init`. folowed by `$ terraform plan` and when everything looks good run `$ terraform apply --auto-approve`
On each folder path in order vpc, sg and ec2. After that run ansible in order 

```git clone --this repo
   terraform init and plan , followed by apply
   ansible-playbook install_docker.yaml
   ansible-playbook deploy_webapp.yaml
   ansible-playbook deploy_health_check.yaml
   curl 54.169.113.99:5000
```
Done! 