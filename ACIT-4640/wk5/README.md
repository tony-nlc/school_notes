[]()```
# https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/packer
packer {
  required_plugins {
    amazon = {
      version = ">= 1.5"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/source
source "amazon-ebs" "debian" {
  ami_name      = "web-nginx-aws"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                = "debian-*-amd64-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["136693071363"]
  }
  ssh_username = "admin"
}

# https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build
build {
  name = "web-nginx"
  sources = [
    # COMPLETE ME Use the source defined above
    "source.amazon-ebs.debian"
  ]
  
  # https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build/provisioner
  provisioner "shell" {
    inline = [
      "echo creating directories",
      # COMPLETE ME add inline scripts to create necessary directories and change directory ownership.
      "mkdir "
      # See nginx.conf file for root directory where files will be served.
      # Files need appropriate ownership for default user
    ]
  }

  provisioner "file" {
    # COMPLETE ME add the HTML file to your image
    inline = [ 
    "tee /web/html/index.html << EOF
	<!DOCTYPE html>
	<html lang='en'>
	<head>
	  <meta charset='UTF-8'>
	  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
	  <title>Lab Week 5</title>
	</head>
	<body>
	  <h1>Lab week 5</h1>
	</body>
	</html>
	EOF"
	]
  }

  provisioner "file" {
    # COMPLETE ME add the nginx.conf file to your image
    inline = []
  }

  # COMPLETE ME add additional provisioners to run shell scripts and complete any other tasks
}


```