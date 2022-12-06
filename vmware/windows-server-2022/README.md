# VMWare appliance - Windows Server 2022 

## Prerequisites

- [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/aws-get-started#installing-packer)
- VMware ([VMware Fusion](https://www.vmware.com/au/products/fusion.html) for Mac and [VMware Workstation](https://www.vmware.com/au/products/workstation-player.html) for Linux/Windows)
- [OVFTool](https://developer.vmware.com/web/tool/4.4.0/ovf). Add OVFtool to your PATH as per your OS.
  - [Windows](https://support.us.ovhcloud.com/hc/en-us/articles/360017548080-How-to-Download-a-VM-as-an-OVF-Using-Windows#VAR)
  - For Mac, export path of your OVFtool or add it to your `.bashrc`

    ```sh
    export PATH=/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/:$PATH
    ```

- When running locally, you can download the required ISO file in the `iso` directory. (Download: [20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso](https://software-download.microsoft.com/download/sg/20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso)) If packer cannot find this file then it'll automatically download it.

## How to run

1. (Optional) Add following env vars to export the logs in a file
   - For Unix/Mac:

      ```sh
      export PACKER_LOG=1
      export PACKER_LOG_PATH="packerlog.txt"
      ```

   - For Windows:

      ```sh
      $env:PACKER_LOG=1
      $env:PACKER_LOG_PATH="packerlog.txt"
      ```

2. (Optional) If you want to follow the build process in GUI, then you need to turn the `headless` bool to `false` in the `windows-2022.json` file.

3. To build a VMware appliance run the following command::

      ```sh
      packer build -only=vmware-iso windows-2022.json
      ```

4. This will take 30 to 90 minutes based on your OS and machine. Grab a coffee and look at the beautiful photos taken by the James Webb Space Telescope. At the end of the process, the OVA will be at `./builds/packer-windows-2022-standard-vmware/tidal-win-22.ova` along with a few other files.

   If you're running the build again, then you'll have to [force](https://www.packer.io/docs/commands/build#force) the build to remove the artifacts from the previous build.

   ```sh
   packer build -only=vmware-iso -force windows-2022.json
   ```

5. (Optional) You can store this OVA file in an S3 bucket after setting up your AWS credentials.

   ```sh
   aws s3 cp ./builds/packer-windows-2022-standard-vmware/tidal-win-22.ova s3://YOUR_BUCKET_NAME/
   ```

## Useful resources

- <https://github.com/chef/bento>
- <https://github.com/pksrc/packer>
- <https://github.com/luciusbono/Packer-Windows10>
- <https://github.com/StefanScherer/packer-windows>
