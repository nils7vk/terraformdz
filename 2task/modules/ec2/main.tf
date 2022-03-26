resource "aws_instance" "tf_24" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name = "cours-key"
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
echo "<h1>Deployed via Terraform</h1>"| sudo tee /usr/share/nginx/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
EOF

  tags = {
    Name = "HelloWorld"
  }
  volume_tags = {
    "Owner" = "terraform"
  }
}
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"]
}
