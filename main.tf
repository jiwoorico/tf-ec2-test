module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
}


module "ec2_instance" {
  source  = "git::git@github.com:jiwoorico/tf-module-ec2.git//?ref=v4.4.0"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}