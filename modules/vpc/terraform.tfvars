# ######################
# COMMON
# ######################
# team
team_name = "PE"

# service name
service_name = "infra2"

# service version
service_version = "0.1"

# env
environment = "prd"

# region
region_name = "ap-northeast-2"
region_nm = "apne2"


# ######################
# VPC
# ######################
# vpc cidr block
vpc_cidr_block = "10.40.0.0/16"


# ######################
# Subnet
# ######################
# public subnet
pub_sn_list = [
  {
    cidr_block = "10.40.10.0/24",
    availability_zone = "ap-northeast-2a",
    Name = "pub-1a-sn"
  },
  {
    cidr_block = "10.40.11.0/24",
    availability_zone = "ap-northeast-2c",
    Name = "pub-1c-sn"
  }
]


# ######################
# Route Table
# ######################
# public route table
public_rt_tag_names = [
  {
    Name = "pub-rt"
  }
]