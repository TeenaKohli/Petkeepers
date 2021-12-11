terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  user_data     = file("file.sh")

  tags = {
    Name = "DevOpsSec-App"
  }
}
