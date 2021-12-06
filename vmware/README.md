# vmware-iso templates

## Prerequisites

- [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started#installing-packer)
- VMware ([VMware Fusion](https://www.vmware.com/au/products/fusion.html) for Mac and [VMware Workstation](https://www.vmware.com/au/products/workstation-player.html) for Linux/Windows)
- [OVFTool](https://developer.vmware.com/web/tool/4.4.0/ovf). Add OVFtool to your PATH as per your OS.
  - [Windows](https://support.us.ovhcloud.com/hc/en-us/articles/360017548080-How-to-Download-a-VM-as-an-OVF-Using-Windows#VAR)
  - For Mac, export path of your OVFtool or add it to your `.bashrc`

    ```sh
    export PATH=/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/:$PATH
    ```

- When running locally, you can download the required ISO file in the `iso` directory. (Download: [ubuntu-18.04.6-server-amd64.iso](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/ubuntu-18.04.6-server-amd64.iso)) If packer cannot find it then it'll automatically download it.

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

3. Build the packer template by running this command

   ```sh
   packer build ubuntu-18.04-amd64.json
   ```

4. This will take 20 to 80 minutes based on your OS and machine. Grab a coffee and appreciate life. At the end of the process, the OVA will be in the `./builds/packer-ubuntu-18.04-amd64-vmware` directory along with a few other files. If you're running the packer template again, the `packer-ubuntu-18.04-amd64-vmware` directory must not exist or be empty.
