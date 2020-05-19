## Infra-2tier VPC
---
`vpc`와 관련 리소스 `eip`, `ingernet-gateway`, `nat-gateway`, `route-table`, `subnet` 등으로 구현되어 있습니다.

---
#### 인프라 구축 방법
※ tf-repository 구축이 선행되어야 합니다.  
```console
cmd $ cd ~
cmd $ mkdir workspace
cmd $ cd workspace

/* git clone */
cmd $ git clone https://github.com/pe-woongjin/infra-2tier.git
cmd $ cd ~/workspace/infra-2tier/modules/vpc

/* terraform */
cmd $ terraform init
cmd $ terraform plan
cmd $ terraform apply
```