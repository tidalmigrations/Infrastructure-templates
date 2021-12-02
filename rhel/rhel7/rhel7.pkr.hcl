
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
    script = "./scripts/setup.sh"
  }
}



