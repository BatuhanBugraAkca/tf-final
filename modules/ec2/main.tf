data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_key_pair" "existing" {
  key_name = var.key_name
}

resource "aws_instance" "web_1" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]  # us-east-1a
  vpc_security_group_ids = [var.security_group_id]
  key_name      = data.aws_key_pair.existing.key_name

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<html><body><h1>(Instance 1)</h1></body></html>" > /var/www/html/index.html
EOF

  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web_2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[1]  # us-east-1b
  vpc_security_group_ids = [var.security_group_id]
  key_name      = data.aws_key_pair.existing.key_name

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<html><body><h1>(Instance 2)</h1></body></html>" > /var/www/html/index.html
EOF

  tags = {
    Name = "web-server-2"
  }
}
