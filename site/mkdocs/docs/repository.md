## infra-2tier-basetf-repository
---
#### 1. S3
`.tfstate` 파일 이력을 S3를 통해 관리할 수 있습니다.
```console
resource "aws_s3_bucket" "terraform-tfstates-mgmt" {    -- S3 설정
    bucket  = var.s3_mgmt                               -- bucket name
    acl     = "private"                                 -- ACL
    
    logging { }                                         -- logging
    
    versioning { }                                      -- versioning
    ...
}
```
![Screenshot](img/s3.png)
>
#### 2. DynamoDB  
S3에서 .tfstate 파일 관리 시, Lock을 통해 안전하게 관리할 수 있도록 구성되어 있습니다.
```console
resource "aws_dynamodb_table" "terraform-lock-table" {    -- DynamoDB 설정
    name            = var.dynamodb_tbl                    -- DB name
    read_capacity   = 5                                   -- 읽기 용량 유닛
    write_capacity  = 5                                   -- 쓰기 용량 유닛
    ...
}
```
![Screenshot](img/db.png)