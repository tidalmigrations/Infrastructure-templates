
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
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


source "amazon-ebs" "ubuntu" {
  ami_name      = "ubuntu-tidal-migrations-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "${var.aws_region}"
  access_key    = "${var.aws_access_key}"
  secret_key    = "${var.aws_secret_key}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "ubuntu-mvp"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {    
    inline = [
      "echo ++ Updating",
      "sleep 30",
      "sudo apt-get update",
      "echo ++ Installing Tidal Tools",
      "sleep 30",
      "curl https://get.tidal.sh/unix | bash",      
      "echo ++ Installing PIP",
      "sudo apt-get install --yes python3-pip",
      "echo ++ Installing jq",
      "sudo apt-get install --yes jq",
      "echo ++ Upgrading PIP",
      "python3 -m pip install --upgrade pip",
      "echo ++ Updating PATH",      
      "export PATH=/home/ubuntu/.local/bin:$PATH",
      "echo ++ Installing Machine-Stats",
      "python3 -m pip install machine-stats",
      "echo ++ Installing Nmap",
      "sudo apt install --yes  nmap",
      "echo ++++ DONE ++++"
    ]
  }
}



