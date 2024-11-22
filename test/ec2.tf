resource "aws_instance" "sample-ec2-01" {
  ami = "ami-040c33c6a51fd5d96"
  instance_type = "t2.micro"
  key_name      = "kosta_edu"
  associate_public_ip_address = true # 퍼블릭 IP 자동 할당
  subnet_id = aws_subnet.sample-subnet-public01.id
  vpc_security_group_ids = [aws_security_group.sample-sg-elb.id]
  user_data = <<-EOF
  #!/bin/bash
  while fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do
      sleep 1
  done
  apt-get update -y
  apt-get install -y nginx
  systemctl start nginx
  systemctl enable nginx
  echo "This is Test Server ----- 1^^" > /var/www/html/index.html
  EOF
  
  root_block_device {
    volume_size = "30"
    volume_type = "gp3"
    tags = {
      "Name" = "sample-ec2-01"
    }
  }
  tags = {
    Name = "sample-ec2-01"
  }
}

resource "aws_instance" "sample-ec2-02" {
  ami = "ami-040c33c6a51fd5d96" 
  instance_type = "t2.micro"
  key_name      = "kosta_edu"
  associate_public_ip_address = true 
  subnet_id = aws_subnet.sample-subnet-public02.id
  vpc_security_group_ids = [aws_security_group.sample-sg-elb.id]
  user_data = <<-EOF
  #!/bin/bash
  while fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do
      sleep 1
  done
  apt-get update -y
  apt-get install -y nginx
  systemctl start nginx
  systemctl enable nginx
  echo "This is Test Server ----- 2^^" > /var/www/html/index.html
  EOF

  root_block_device {
    volume_size = "30"
    volume_type = "gp3"
    tags = {
      "Name" = "sample-ec2-02"
    }
  }

  tags = {
    Name = "sample-ec2-02"
  }
}