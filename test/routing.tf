#### public subnet route table ###########
resource "aws_route_table" "sample-rt-public" {
vpc_id = aws_vpc.sample-vpc.id
tags = {
Name = "sample-rt-public"
}
}

#### private subnet route table ###########

resource "aws_route_table" "sample-rt-private01" {
vpc_id = aws_vpc.sample-vpc.id
tags = {
Name = "sample-rt-private01"
}
}
resource "aws_route_table" "sample-rt-private02" {
vpc_id = aws_vpc.sample-vpc.id
tags = {
Name = "sample-rt-private02"
}
}

resource "aws_route_table_association" "sample_route_table_associate_public-a" {
subnet_id = aws_subnet.sample-subnet-public01.id
route_table_id = aws_route_table.sample-rt-public.id
}
resource "aws_route_table_association" "sample_route_table_associate_public-b" {
subnet_id = aws_subnet.sample-subnet-public02.id
route_table_id = aws_route_table.sample-rt-public.id
}

resource "aws_route_table_association" "sample_route_table_associate_private1" {
subnet_id = aws_subnet.sample-subnet-private01.id
route_table_id = aws_route_table.sample-rt-private01.id
}
resource "aws_route_table_association" "sample_route_table_associate_private2" {
subnet_id = aws_subnet.sample-subnet-private02.id
route_table_id = aws_route_table.sample-rt-private02.id
}

#### public subnet route ###########

resource "aws_route" "sample-public-route" {
route_table_id = aws_route_table.sample-rt-public.id
destination_cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.sample-igw.id
}

#### Private subnet route ###########

resource "aws_route" "sample-private-route01" {
route_table_id = aws_route_table.sample-rt-private01.id
destination_cidr_block = "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.sample-ngw-01.id
}
resource "aws_route" "sample-private-route02" {
route_table_id = aws_route_table.sample-rt-private02.id
destination_cidr_block = "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.sample-ngw-02.id
}

