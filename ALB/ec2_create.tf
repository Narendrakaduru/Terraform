resource "aws_instance" "VM" {
  count                  = var.instance_count
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "test"
  subnet_id              = var.subnets[count.index]
  vpc_security_group_ids = [aws_security_group.My-All-SG.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    echo "WEB-SERVER-${count.index + 1}" > /var/www/html/index.html
  EOF

  tags = {
    Name = "My-VM-${count.index + 1}"
  }
}