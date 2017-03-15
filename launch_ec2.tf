provider "aws" {
  access_key = "***************************"
  secret_key = "*************************************"
  region     = "ap-northeast-1"
}


resource "aws_instance" "goserver" {
  ami = "ami-56d4ad31"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-f7238290"]
  key_name = "my_key"
  tags {
        Name = "go_server_DEMO"
        }
  subnet_id = "subnet-8abf4fe2"
  user_data = "${file("userdata_goserver.sh")}"
}

resource "aws_instance" "kubews" {
  ami = "ami-56d4ad31"
  instance_type = "m3.medium"
  vpc_security_group_ids = ["sg-f7238290"]
  key_name = "my_key"
  tags {
        Name = "go_agent_kubernetes_DEMO"
        }
  subnet_id = "subnet-8abf4fe2"
  root_block_device {
        volume_type = "gp2"
        volume_size = "30"
    }
  user_data = "${file("userdata_gokube.sh")}"
}
