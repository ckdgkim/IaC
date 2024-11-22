resource "aws_eip" "nat_ip01" {
domain   = "vpc"
lifecycle {
create_before_destroy = true
}
}
resource "aws_eip" "nat_ip02" {
domain   = "vpc"
lifecycle {
create_before_destroy = true
}
}

resource "aws_nat_gateway" "sample-ngw-01" {
allocation_id = aws_eip.nat_ip01.id
subnet_id = aws_subnet.sample-subnet-public01.id
tags = {
Name = "sample-ngw-01"
}
}

resource "aws_nat_gateway" "sample-ngw-02" {
allocation_id = aws_eip.nat_ip02.id
subnet_id = aws_subnet.sample-subnet-public02.id
tags = {
Name = "sample-ngw-02"
}
}