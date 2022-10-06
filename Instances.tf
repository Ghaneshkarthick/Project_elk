

resource "aws_instance" "Bastion_Host" {
  ami           = data.aws_ami.Bastion_Host.id
  instance_type = "t2.micro"

  #VPC
  vpc_security_group_ids = [aws_security_group.bastion_host_server_sg.id] #VPC
  #Keypair
  key_name = var.key_name
  #Subnet_id
  subnet_id = data.aws_subnet.public_a.id

  

  tags = {
    Name = "Bastion_host"
  }

}


resource "aws_instance" "Kibana_server" {
  ami                    = data.aws_ami.Kibana_server.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.public_a.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Kibana_sg.id]

  tags = {
    Name = "Kibana_server"
  }
}



resource "aws_instance" "Es_server" {
  ami                    = data.aws_ami.Es_server.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.private_a.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Elasticsearch_sg.id]

  tags = {
    Name = "Es_server"
  }
}



resource "aws_instance" "Demo-1" {

  ami                    = data.aws_ami.Demo_Server.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.private_a.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Demo_server_sg.id]

  tags = {
    Name = "Demo_Server-1"
  }
}

resource "aws_instance" "Demo-2" {

  ami                    = data.aws_ami.Demo_Server.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.private_b.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Demo_server_sg.id]

  tags = {
    Name = "Demo_Server-2"
  }
}

resource "aws_instance" "Demo-3" {

  ami                    = data.aws_ami.Demo_Server.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.private_c.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Demo_server_sg.id]

  tags = {
    Name = "Demo_Server-3"
  }
}



resource "aws_instance" "Logstash_server" {
  ami                    = data.aws_ami.Logstash_server.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.private_a.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.logstash_sg.id]

  tags = {
    Name = "Logstash Server"
  }
}

