# VMWare appliance - Ubuntu 18.04

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

## List of software installed on Ubuntu OVA

- Tidal Tools
- Machine Stats
- Nmap
- DNS tools
- Docker
- Docker images
  - Cast Highlights
  - Tidal DB Analyzer
  - Healthchek
  - Hello World
- Pip
- jq
- Python3

## How to run

1. (Optional) Add following env vars to export the logs in a file

   ```sh
   export PACKER_LOG=1
   export PACKER_LOG_PATH="packerlog.txt"
   ```

2. (Optional) If you want to follow the build process in GUI, then you need to turn the `headless` bool to `false` in the `ubuntu-18-04-amd64.json` file.

3. To build a VMware appliance run the following command:

   ```sh
   packer build ubuntu-18.04-amd64.json
   ```

4. This will take 20 to 80 minutes based on your OS and machine. Grab a coffee and appreciate life. At the end of the process, the OVA will be at `./builds/packer-ubuntu-18-04-amd64-vmware/tidal-ubuntu-18-04-server-amd64.ova` along with a few other files.

   If you're running the build again, then you'll have to [force](https://www.packer.io/docs/commands/build#force) it to remove the artifacts from the previous build.

   ```sh
   packer build -force ubuntu-18.04-amd64.json
   ```

5. (Optional) You can store this OVA file in an S3 bucket after setting up your AWS credentials.

   ```sh
   aws s3 cp ./builds/packer-ubuntu-18-04-amd64-vmware/tidal-ubuntu-18-04-server-amd64.ova s3://YOUR_BUCKET_NAME/
   ```

## Useful resources

- <https://github.com/chef/bento>
