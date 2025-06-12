ami_id            = "ami-0c7217cdde317cfec"
instance_type     = "t2.micro"
subnet_id         = "subnet-xxxxxx" # module.network.public_subnet_ids[0] ile de otomatik çekilebilir
security_group_id = "sg-xxxxxx"
key_name          = "bba06"
db_password       = "admin123"
