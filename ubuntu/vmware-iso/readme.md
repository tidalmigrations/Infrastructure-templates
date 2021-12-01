### Run locally

- To run the `vmware-iso` packer template
  `packer build ubuntu-18.04-amd64.json`

- (Optional) Add following env vars to export the logs in a file
  - `export PACKER_LOG=1`
  - `export PACKER_LOG_PATH="packerlog.txt"`
