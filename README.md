# Infrastructure-templates

A collection of Packer templates to create AWS AMIs and VMware image with our projects installed and configured. This repository contains packer templates created using [amazon-ebs](https://www.packer.io/docs/builders/amazon/ebs) and [vmware-iso](https://www.packer.io/docs/builders/vmware/iso) builders.

The [amazon-ebs](https://www.packer.io/docs/builders/amazon/ebs) builder leverages the AWS EC2 and creates an Amazon Machine Image (AMI), while the [vmware-iso](https://www.packer.io/docs/builders/vmware/iso) builder uses VMware tools and exports an OVA file.

Requirements and steps to run these packer templates are inside their respective folders.

## Folder Structure

```text
infrastructure-templates
├── README.md
├── .github
│   └── workflows
│       └── publish-images.yml
├── aws
|   ├── README.md
|   ├── ubuntu
|   │   ├── scripts
|   │   │   └── setup.sh
|   │   ├── ubuntu-18-04
|   │   │   ├── config.auto.pkrvars.hcl
|   │   │   └── ubuntu-bionic.pkr.hcl
|   │   └── ubuntu-20-04
|   │       ├── config.auto.pkrvars.hcl
|   │       └── ubuntu-focal.pkr.hcl
|   ├── rhel
|   │   ├── rhel7
|   │   ├── scripts
|   │   │   └── setup.sh
|   │   ├── config.auto.pkrvars.hcl
|   │   └── rhel7.pkr.hcl
|   └── windows
|       ├── scripts
|       |   ├── install_git.ps1
|       |   ├── install_machine_stats.ps1
|       |   ├── install_tidal_tools.ps1
|       │   └── win_user_data.txt
|       └── windows-server-2019
|           ├── config.auto.pkrvars.hcl
|           └── windows-server-2019.pkr.hcl
└── vmware
    ├── README.md
    ├── windows-server-2022
    |   ├── cookbooks
    |   │   └── packer
    |   ├── scripts
    |   |   ├── common
    |   |   ├── tidal
    |   │   └── unattended
    |   └── windows-2022.json
    └── ubuntu-18-04
        ├── scripts
        |   ├── cleanup.sh
        |   ├── networking.sh
        |   ├── sshd.sh
        |   ├── tidal-ubuntu-1804.sh
        |   ├── update.sh
        |   ├── vagrant.sh
        │   └── vmware.sh
        ├── http
        |   ├── preseed.cfg
        |   ├── meta-data
        │   └── user-data
        └── ubuntu-18-04-amd64.json
```
