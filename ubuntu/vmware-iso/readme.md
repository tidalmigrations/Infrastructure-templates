### Prerequisites

- [Packer](https://www.packer.io/downloads)
- [Vagrant](https://www.vagrantup.com/downloads)
- [OVFTool](https://developer.vmware.com/web/tool/4.4.0/ovf)
- (Optional) ISO file in the `./iso/` directory. (Download: [ubuntu-18.04.6-server-amd64.iso](https://cdimage.ubuntu.com/ubuntu/releases/18.04.6/release/ubuntu-18.04.6-server-amd64.iso))

### Run locally

- To run the `vmware-iso` packer template
  `packer build ubuntu-18.04-amd64.json`

- (Optional) Add following env vars to export the logs in a file
  - `export PACKER_LOG=1`
  - `export PACKER_LOG_PATH="packerlog.txt"`
