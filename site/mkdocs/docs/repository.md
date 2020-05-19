## Infra-2tier tf-repository
---
#### 1. S3
>`.tfstate` 파일 이력을 S3를 통해 관리할 수 있습니다.
![Screenshot](img/s3.png)
>
#### 2. DynamoDB  
>S3에서 .tfstate 파일 관리 시, Lock을 통해 안전하게 관리할 수 있도록 구성되어 있습니다.
![Screenshot](img/db.png)