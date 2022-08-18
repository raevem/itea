terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

#resource "aws_instance" "jenkins_server" {
#  ami           = "ami-0cea098ed2ac54925"
#  instance_type = "t2.micro"
#
#  tags = {
#    Name = "JenkinsServer"
#  }
#}
resource "aws_ecs_cluster" "dockercluster" {
  name = "GoLang"
  setting {
    name  = "containerForGoLangServer"
    value = "enabled"
  }
}
