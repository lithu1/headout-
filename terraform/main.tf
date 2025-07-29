provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "app" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = file("ec2-user-data.sh")
  tags = {
    Name = "JavaAppInstance"
  }
}

resource "aws_elb" "app_elb" {
  name               = "java-app-elb"
  availability_zones = ["us-east-1a"]
  listener {
    instance_port     = 9000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  instances = [aws_instance.app.id]
}
