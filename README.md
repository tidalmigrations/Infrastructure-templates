# Infrastructure-templates

A collection of Packer templates to create AMI with our projects installed and configured.


## Installation

You can find the installation instruction for you OS [here](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started#installing-packer)



## Folder Structure
```
.
└── .github 
    ├── workflows    
    |   └── publish-images.yml
    ├── 2015 
│   └── index.markdown
├── _posts 
│   └── 2014-12-27-2014-yili-degerlendirmesi.markdown
├── _stash 
└── update.sh 

infrastructure-templates
├── README.md
├── .github
│   └── workflows
│       └── publish-images.yml
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
## Requirements

* Packer
* AWS credentials
    * AWS_ACCESS_KEY_ID
    * AWS_SECRET_ACCESS_KEY

## How to use it

1. Make sure you have exported your AWS credentials. To do so, run the following command on your active shell.
    ```
    export AWS_ACCESS_KEY_ID = ***********
    ```
    ```
    export AWS_SECRET_ACCESS_KEY = ***********
    ```

2. Navigate to the image folder you plan to generate. For example, ubuntu-20-04
    ```
    cd ubuntu/ubuntu-20-04
    ```

3. Build the image by running this command
    ```
    packer build .
    ```

*Note: you can adjust the region where your images will be deploy by modifying the `config.auto.pkrvars.hcl` file found in each one of the folders*