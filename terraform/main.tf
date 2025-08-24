module "dev-infra" {
    source = "./infra"
    ami_id = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    instance_count = 2
    root_block_device = 10
    env = "dev"
  
}

module "stg-infra" {
    source = "./infra"
    ami_id = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    instance_count = 2
    root_block_device = 10
    env = "stg"
  
}
module "prd-infra" {
    source = "./infra"
    ami_id = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    instance_count = 3
    root_block_device = 10
    env = "prd"
  
}

output "dev_infra_ec2_public_ips" {
  value = module.dev-infra.instance_public_ips
}


output "stg_infra_ec2_public_ips" {
  value = module.stg-infra.instance_public_ips
}


output "prd_infra_ec2_public_ips" {
  value = module.prd-infra.instance_public_ips
}