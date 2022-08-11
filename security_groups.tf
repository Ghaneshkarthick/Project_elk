resource "aws_security_group" "Demo_server_sg" {
  name        = "Demo_server_sg"
  description = "Allow elk connection to demo servers"
  vpc_id      = data.aws_vpc.Elk_vpc.id

  ingress {
    description      = "Rest Api call"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Node communication"
    from_port        = 9300
    to_port          = 9300
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Internet communication"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH from Bastion host"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Demo server sg"
  }
}