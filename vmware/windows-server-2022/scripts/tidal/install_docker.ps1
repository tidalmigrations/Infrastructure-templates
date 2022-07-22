# Install docker module
Install-Module -Name DockerMsftProvider -Repository PSGallery -Confirm:$False -Force

# Install docker package
Install-Package -Name docker -ProviderName DockerMsftProvider -Force
