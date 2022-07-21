# VMWare templates

This folder contains [vmware-iso](https://www.packer.io/plugins/builders/vmware/iso) packer builder templates that can be used to create the Ubuntu or Windows server OVA file with all necessary Tidal software already installed in it. More information on how to build the OVA is in the READMEs within the folders.

- [Ubuntu 18.04](/ubuntu-18-04/):
  Create an Ubuntu 18.04 OVA file with all the tidal software already installed in it.

- [Windows Server 2022](/windows-server-2022/)
  Create a Windows Server 2022 OVA file with Tidal Tools and Machine Stats installed in it.

## List of software installed on Ubuntu OVA

- Tidal Tools
- Machine Stats (main or alpha)
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
