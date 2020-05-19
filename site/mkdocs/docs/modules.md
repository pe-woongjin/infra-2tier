## Infra-2tier modules
---
modules는 `vpc`, `elb`, `iam`로 구성되어 있습니다.

---
#### 1. VPC
>`vpc`와 관련 리소스 `eip`, `internet-gateway`, `nat-gateway`, `route-table`, `subnet` 등으로 구현되어 있습니다.  
>
#### 2. ELB
>`Application Load Balancer`가 구현되어 있습니다.
>
#### 3. IAM
![Screenshot](img/role.png)
##### 3.1 EC2
>EC2에서 사용하는 `role`을 정의합니다.
![Screenshot](img/role-ec2.png)
>
##### 3.2 Code-Deploy  
>Code-Deploy에서 사용하는 `role`을 정의합니다.
![Screenshot](img/role-cd.png)