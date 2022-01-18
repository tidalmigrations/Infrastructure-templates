# Infrastructure-templates

A collection of Packer templates to create AWS AMIs with our projects installed and configured. This repository contains packer templates created using [amazon-ebs](https://www.packer.io/docs/builders/amazon/ebs) builder. It leverages the AWS EC2 and creates an Amazon Machine Image (AMI).

Requirements and steps to run this packer template is inside `aws` folder.

## Folder Structure

```
infrastructure-templates
├── README.md
├── .github
│   └── workflows
│       └── publish-images.yml
└── aws
    ├── README.md
    ├── ubuntu
    │   ├── scripts
    │   │   └── setup.sh
    │   ├── ubuntu-18-04
    │   │   ├── config.auto.pkrvars.hcl
    │   │   └── ubuntu-bionic.pkr.hcl
    │   └── ubuntu-20-04
    │       ├── config.auto.pkrvars.hcl
    │       └── ubuntu-focal.pkr.hcl
    └── rhel
        └── rhel7
        ├── scripts
        │   └── setup.sh
        ├── config.auto.pkrvars.hcl
        └── rhel7.pkr.hcl
```
