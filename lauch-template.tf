resource "aws_launch_template" "template" {
  name          = "web-launchtemplate"
  # ID of the Amazon Machine Image (AMI) to use for the instance
  image_id      = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
  key_name = "jenkins-master"

  network_interfaces {
    device_index = 0
    security_groups = [aws_security_group.asg_security_group.id]
  }

  user_data = filebase64("user-data.sh")
  tag_specifications {
    
    resource_type = "instance"
    tags = {
      Name = "first"
    }
  }
}

