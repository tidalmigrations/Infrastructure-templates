# Install dockeraccesshelper module to allow
# docker access to non-root user
# Source: https://github.com/tfenster/dockeraccesshelper
Install-Module -Name dockeraccesshelper -Force

# Add vagrant user for docker access
Add-AccountToDockerAccess "\vagrant"
