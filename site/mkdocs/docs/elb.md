## Infra-2tier ELB
---
`Application Load Balancer`가 구현되어 있습니다.

---
#### 인프라 구축 방법
※ tf-repository, vpc 구축이 선행되어야 합니다.  
```console
cmd $ cd ~
cmd $ mkdir workspace
cmd $ cd workspace

/* git clone */
cmd $ git clone https://github.com/pe-woongjin/infra-2tier.git
cmd $ cd ~/workspace/infra-2tier/modules/elb

/* terraform */
cmd $ terraform init
cmd $ terraform plan
cmd $ terraform apply
```