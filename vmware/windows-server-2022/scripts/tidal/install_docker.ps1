# Install NuGet provider
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Scope 'AllUsers' -Force

# Install docker module
Install-Module -Name DockerMsftProvider -Repository PSGallery -Confirm:$False -Force

# Install docker package
Install-Package -Name docker -ProviderName DockerMsftProvider -Force
