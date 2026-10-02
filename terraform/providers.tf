terraform {
  required_version = ">1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"

    }
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      project      = "CloudscalerInterviewlab"
      Envioronment = "Trainig"
      ManagedBy    = "Teraform"

    }
  }
}
