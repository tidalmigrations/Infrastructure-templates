packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


variable aws_access_key {
  type        = string
  default     = ""
  description = "Add your AWS Access Key ID"
  sensitive   = true
}
variable aws_secret_key {
  type        = string
  default     = ""
  description = "Add your AWS Secret Access key"
  sensitive   = true
}
variable aws_region {
  type        = string
  default     = ""
}


source "amazon-ebs" "windows-2019" {
  ami_name      = "tidal-migrations-windows-server-2019"
  communicator  = "winrm"
  instance_type = "t3.micro"
  region        = "${var.aws_region}"
  access_key    = "${var.aws_access_key}"
  secret_key    = "${var.aws_secret_key}"

  source_ami_filter {
    filters = {
      name                = "*Windows_Server-2019-English-Full-Base-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }

  user_data_file = "../scripts/win_user_data.txt"

  winrm_username = "Administrator"
  winrm_password = "Dev12345"

  force_deregister      = true
  force_delete_snapshot = true
}


build {
  name    = "win-build"
  sources = [
    "source.amazon-ebs.windows-2019"
  ]

  provisioner "powershell" {    
    script = "../scripts/install_tidal_tools.ps1"
  }

  provisioner "powershell" {
    script = "../scripts/install_git.ps1"
  }

  provisioner "powershell" {
    script = "../scripts/install_machine_stats.ps1"
  }
}
