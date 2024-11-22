resource "aws_instance" "sample-ec2-01" {
  ami = "ami-0de20b1c8590e09c5"
  instance_type = "t2.micro"
  key_name      = "kosta_edu"
  associate_public_ip_address = true # 퍼블릭 IP 자동 할당
  subnet_id = aws_subnet.sample-subnet-public01.id
  vpc_security_group_ids = [aws_security_group.sample-sg-elb.id]
  user_data = <<EOF
		#! /bin/bash
    sudo apt update
	  sudo apt install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "This is Test Server" > /usr/share/nginx/html/index.html
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
  ami = "ami-0de20b1c8590e09c5" 
  instance_type = "t2.micro"
  key_name      = "kosta_edu"
  associate_public_ip_address = true 
  subnet_id = aws_subnet.sample-subnet-public02.id
  vpc_security_group_ids = [aws_security_group.sample-sg-elb.id]
  user_data = <<EOF
		#! /bin/bash
    sudo apt update
	  sudo apt install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "This is Test Server-----2" > /usr/share/nginx/html/index.html
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