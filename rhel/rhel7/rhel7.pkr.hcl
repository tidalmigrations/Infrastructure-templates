
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

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "rhel7" {
  ami_name      = "tidal-migrations-rhel7-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "${var.aws_region}"
  access_key    = "${var.aws_access_key}"
  secret_key    = "${var.aws_secret_key}"
  source_ami    = "ami-02d40d11bb3aaf3e5"
  ssh_username = "ec2-user"
}

build {
  name    = "rhel7-mvp"
  sources = [
    "source.amazon-ebs.rhel7"
  ]

  provisioner "shell" {    
    inline = [
      "echo ++ Updating",
      "sudo yum -y update",
      "echo ++ Install Python36",
      "sudo yum install -y python36",
      "sudo pip3 install --upgrade pip",
      "echo ++ install JQ",
      "sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
      "sudo yum install -y jq",
      "echo ++ Installing Machine-Stats",
      "pip3 install --user machine-stats",
      "echo ++ Installing Tidal Tools",
      "curl https://get.tidal.sh/unix | bash",
      "echo ++ Installing Nmap",
      "sudo yum install -y nmap",
      "echo ++++ DONE ++++"
    ]
  }
}



