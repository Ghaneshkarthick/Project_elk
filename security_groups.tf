resource "aws_security_group" "Demo_server_sg" {
  name        = "Demo_server_sg"
  description = "Allow elk connection to demo servers"
  vpc_id      = data.aws_vpc.Elk_vpc.id

  ingress {
    description      = "Rest Api call"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    security_groups = [aws_security_group.Elasticsearch_sg.id]
  }
  ingress {
    description      = "Node communication"
    from_port        = 9300
    to_port          = 9300
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "SSH from Bastion host"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [aws_security_group.bastion_host_server_sg.id]
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
#Security group for Bastio Host server
resource "aws_security_group" "bastion_host_server_sg" {
  name        = "bastion-host-server"
  description = "Allow connection for bastion host server."
  vpc_id      = data.aws_vpc.Elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.218.112.10/32"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}

resource "aws_security_group" "Kibana_sg" {
  name        = "Kibana_sg"
  description = "Allow connection for kibana server."
  vpc_id      = data.aws_vpc.Elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_host_server_sg.id] 
  }
  ingress {
    description = "HTTP connection to Kibana"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["103.218.112.10/32"]
    
  }
  ingress {
    description = "Allow communication from elastic search"
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    security_groups = [aws_security_group.Elasticsearch_sg.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}
resource "aws_security_group" "Elasticsearch_sg" {
  name        = "Elasticsearch_sg"
  description = "Allow connection to Elasticsearch_sg."
  vpc_id      = data.aws_vpc.Elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_host_server_sg.id]
    
  }
  ingress {
    description = "Allow communication from kibana"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    security_groups = [aws_security_group.Kibana_sg.id]
    
  }
  ingress {
    description = "Allow communication from Logstash"
    from_port   = 9600
    to_port     = 9600
    protocol    = "tcp"
    security_groups = [aws_security_group.logstash_sg.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}
resource "aws_security_group" "logstash_sg" {
  name        = "Logstash_server"
  description = "Allow connection for Logstash server."
  vpc_id      = data.aws_vpc.Elk_vpc.id

  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_host_server_sg.id]
    
  }
  ingress {
    description = "Allow communication from Elastic search"
    from_port   = 9600
    to_port     = 9600
    protocol    = "tcp"
    security_groups = [aws_security_group.Elasticsearch_sg.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}