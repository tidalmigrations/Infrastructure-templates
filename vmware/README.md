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

2. (Optional) Add following env vars to export the logs in a file.
   - For Unix

     ```sh
     export PACKER_LOG=1
     export PACKER_LOG_PATH="packerlog.txt"
     ```

   - For Windows

     ```sh
     $env:PACKER_LOG=1
     $env:PACKER_LOG_PATH="packerlog.txt"
     ```

3. (Optional) If you want to follow the build process in GUI, then you need to turn the `headless` bool to `false` in the `ubuntu-18-04-amd64.json` file.

4. Build the packer template by running one of these commands:
   - **Option A**: To build the appliance with [Machine Stats' stable version](https://pypi.org/project/machine-stats/).

      ```sh
      packer build ubuntu-18.04-amd64.json
      ```

   - **Option B**: To build the appliance with [Machine Stats Alpha](https://pypi.org/project/machine-stats-alpha/).

      ```sh
      packer build ubuntu-18.04-amd64-alpha.json
      ```

5. This will take 20 to 80 minutes based on your OS and machine. Grab a coffee and appreciate life. At the end of the process, the OVA will be at `./builds/packer-ubuntu-18-04-amd64-vmware/tidal-ubuntu-18-04-server-amd64.ova` along with a few other files. If you're running the packer template again, the `packer-ubuntu-18-04-amd64-vmware` directory must not exist or be empty.

6. Optionally, you can store this OVA file in an S3 bucket after setting up your AWS credentials.

   ```sh
   aws s3 cp ./builds/packer-ubuntu-18-04-amd64-vmware/tidal-ubuntu-18-04-server-amd64.ova s3://YOUR_BUCKET_NAME/
   ```
