# Instance : test-ec2 
resource "aws_instance" "test-ec2" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.lms_public_subnet.id
  key_name = "murali"
  vpc_security_group_ids = [aws_security_group.lms-sg.id]
#  user_data = file("install_ansible.sh")  ---> if have any
  private_ip = "10.0.1.10"    # to assign custom pvt-ip
  tags = {
    Name = "test-ec2"
  }
}
