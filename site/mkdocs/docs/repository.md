## Infra-2tier tf-repository
---
#### 1. 구성
##### 1.1 S3
>각 모듈별 `.tfstate` 파일 이력을 S3를 통해 관리할 수 있습니다.
![Screenshot](img/s3.png)
>
##### 1.2 DynamoDB  
>S3에서 .tfstate 파일 관리 시, Lock을 통해 안전하게 관리할 수 있도록 구성되어 있습니다.
![Screenshot](img/db.png)
>
#### 2. 인프라 구축 방법
```console
cmd $ cd ~
cmd $ mkdir workspace
cmd $ cd workspace

/* git clone */
cmd $ git clone https://github.com/pe-woongjin/infra-2tier.git
cmd $ cd ~/workspace/infra-2tier/modules/tf-repository

/* terraform */
cmd $ terraform init
cmd $ terraform plan
cmd $ terraform apply
```