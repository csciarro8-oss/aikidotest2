# Intentionally insecure Terraform for IaC scanners.
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "data" {
  bucket = "demo-public-bucket-12345"
  acl    = "public-read" # public bucket
}

resource "aws_security_group" "open" {
  name = "allow_all"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to the world
  }
}

resource "aws_db_instance" "db" {
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  username            = "admin"
  password            = "password123" # hardcoded
  publicly_accessible = true
  storage_encrypted   = false
  skip_final_snapshot = true
}
