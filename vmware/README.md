# vmware-iso templates

## Prerequisites

- [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started#installing-packer)
- [OVFTool](https://developer.vmware.com/web/tool/4.4.0/ovf). Add OVFtool to your PATH as per your OS. ([Windows](https://support.us.ovhcloud.com/hc/en-us/articles/360017548080-How-to-Download-a-VM-as-an-OVF-Using-Windows#VAR))
- VMware ([VMware Fusion](https://www.vmware.com/au/products/fusion.html) for Mac and [VMware Workstation](https://www.vmware.com/au/products/workstation-player.html) for Linux/Windows)
- When running locally, you can download the required ISO file in the `./iso/` directory. (Download: [ubuntu-18.04.6-server-amd64.iso](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/ubuntu-18.04.6-server-amd64.iso)) If packer cannot find it then it'll automatically download it.

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
