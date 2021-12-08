# AWS Builders

## Requirements

* Packer (You can find the installation instruction for your OS [here](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started#installing-packer))
* AWS credentials
  * AWS_ACCESS_KEY_ID
  * AWS_SECRET_ACCESS_KEY

## How to use it

1. Make sure you have exported your AWS credentials. To do so, run the following command on your active shell.

    ```sh
    export AWS_ACCESS_KEY_ID = ***********
    export AWS_SECRET_ACCESS_KEY = ***********
    ```

    Make sure that your AWS user has following permissions.

    ```text
    EC2:CreateImage
    EC2:DeleteKeyPair
    EC2:DeleteSecurityGroup
    EC2:DeleteSnapshot
    EC2:DeregisterImage
    EC2:DescribeImages
    EC2:DescribeInstances
    EC2:DescribeVolumes
    EC2:StopInstances
    EC2:TerminateInstances
    ```

2. Navigate to the image folder you plan to generate. For example, ubuntu-20-04

    ```sh
    cd ubuntu/ubuntu-20-04
    ```

3. Build the image by running this command

    ```sh
    packer build .
    ```

4. Once Packer is done building the image, you can find it in your AWS AMI section. (Make sure you are in the same region you have on your `config.auto.pkrvars.hcl` file)

*Note: you can adjust the region where your images will be deploy by modifying the `config.auto.pkrvars.hcl` file found in each one of the folders*
