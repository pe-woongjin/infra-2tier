## Infra-2tier 소개
---
Infra 2tier Architecture를 Terraform으로 구현한 프로젝트입니다.    
프로젝트 빌드 및 실행은 다음과 같은 순서로 이루어집니다.  
>
##### 1. IAM 계정 생성 및 AWS CLI 를 통한 로컬 환경 구성
* aws iam account 생성 (aws console)  
AWS 관리 콘솔에서 프로그래밍 방식 로그인 계정 생성 및 AdministratorRole 부여  
>
* awscli install  
```console
cmd $ brew install awscli
```  

* AWS local 환경 설정 
```console
    cmd $ aws configure

    AWS Access Key ID [****************KCPQ]: 
    AWS Secret Access Key [****************OSRk]: 
    Default region name [ap-northeast-2]: 
    Default output format [None]: 
```

##### 2. terraform 설치 및 적용 
###### 2.1 terraform 설치
* terraform install
```console
cmd $ brew install terraform
```

###### 2.2. terraform 프로젝트 구성 (git clone)
```console
cmd $ cd ~
cmd $ mkdir workspace
cmd $ cd workspace

/* git clone */
cmd $ git clone https://github.com/pe-woongjin/infra-2tier.git
cmd $ cd ~/workspace/infra-2tier/modules
```

###### 2.3 terraform 단계별 적용
* 초기 구성
```console
cmd $ terraform init
```

* 플랜 및 검증
```console
cmd $ terraform plan
```

* 프로비저닝
```console
cmd $ terraform apply
```

* 인프라 삭제
```console
cmd $  terraform destory
``` 