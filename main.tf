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
<<<<<<< HEAD
  user_data     = file("file.sh")
=======
  user_data     = "file.sh"
>>>>>>> 879cfe0f7b0cbcc14e9d296b6315372ea32761bc

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
