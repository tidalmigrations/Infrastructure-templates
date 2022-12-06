# VMWare templates

This folder contains [vmware-iso](https://www.packer.io/plugins/builders/vmware/iso) packer builder templates that can be used to create the Ubuntu or Windows server OVA file with all necessary Tidal software already installed in it. More information on how to build the OVA is in the READMEs within the folders.

> Instructions applicable to MacOS

- [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started#installing-packer)
- VMware ([VMware Fusion](https://www.vmware.com/au/products/fusion.html) for Mac and [VMware Workstation](https://www.vmware.com/au/products/workstation-player.html) for Linux/Windows)
- [OVFTool](https://developer.vmware.com/web/tool/4.4.0/ovf). Add OVFtool to your PATH as per your OS.
  - [Windows](https://support.us.ovhcloud.com/hc/en-us/articles/360017548080-How-to-Download-a-VM-as-an-OVF-Using-Windows#VAR)
  - For Mac, export path of your OVFtool or add it to your `.bashrc`

- [Windows Server 2022](/windows-server-2022/)
  Create a Windows Server 2022 OVA file with Tidal Tools and Machine Stats installed in it.

## List of software installed on Ubuntu OVA

## How to run

1. Navigate to the image folder you plan to generate. For example, ubuntu-18-04

    ```sh
    cd ubuntu-18-04
    ```

2. (Optional) Add following env vars to export the logs in a file

   ```sh
   export PACKER_LOG=1
   export PACKER_LOG_PATH="packerlog.txt"
   ```

3. (Optional) If you want to follow the build process in GUI, then you need to turn the `headless` bool to `false` in the `ubuntu-18-04-amd64.json` file.

4. (Optional) If you have built a VM appliance before, You will have a folder with its content inside the `/builds/` directory. You will need to delete any existing build before proceeding. Run this command to do so:

   ```sh
   rm -rf /builds/*
   ```

5. To build a VMware appliance run the following Packer command.
   - **Option A**: To build the appliance with [Machine Stats' stable version](https://pypi.org/project/machine-stats/).

      ```sh
      packer build ubuntu-18.04-amd64.json
      ```

   - **Option B**: To build the appliance with [Machine Stats Alpha](https://pypi.org/project/machine-stats-alpha/).

      ```sh
      packer build ubuntu-18.04-amd64-alpha.json
      ```

6. This will take 20 to 80 minutes based on your OS and machine. Grab a coffee and appreciate life. At the end of the process, the OVA will be at `./builds/packer-ubuntu-18-04-amd64-vmware/tidal-ubuntu-18-04-server-amd64.ova` along with a few other files.

7. Optionally, you can store this OVA file in an S3 bucket after setting up your AWS credentials.

   ```sh
   aws s3 cp ./builds/packer-ubuntu-18-04-amd64-vmware/tidal-ubuntu-18-04-server-amd64.ova s3://YOUR_BUCKET_NAME/
   ```
