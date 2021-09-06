# Terraform Installation Script (Linux)
[![Build](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

---
## Description
It's a simple bash script for terraform compilation installation. 
What is terraform: Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language,

----
## Feature
- Terraform installation (automated with bash)
- Compilation (installation method)

----
## Pre-Requests
- It's supported for Linux

```sh
-RedHat-

yum install git -y
yum install unzip -y

-Debian-

sudo apt install git -y
sudo apt install unzip -y
```
> it depends on your operating system repository

---
## How to Get
```
git clone https://github.com/yousafkhamza/Terraform_installation.git
cd Terraform_installation
chmod +x terraform.sh
```

----
## Output Be Like
_Newly installed server_
```
[root@ip-172-31-43-204 ~]# /bin/bash terraform.sh
Terraform installation begins..........
Downloading Terraform From Hashicorp .............
Archive:  /tmp/terraform_1.0.6_linux_amd64.zip
  inflating: terraform
Terraform installation successful..........

The Terraform version is given below......
-----------
Terraform v1.0.6
on linux_amd64
-----------
```
_Already installed on your server its shown to be like_
```
[root@ip-172-31-43-204 ~]# /bin/bash terraform.sh
Terraform Already Installed On The Server...........

The Terrform version is given below......
-----------
Terraform v1.0.6
on linux_amd64
-----------
```

----
## Behind the Code
```
#!/bin/bash

# -----------------------------------------
# Terraform installation script for Linux
# -----------------------------------------

function terraform_installtion () {
    echo "Downloading Terraform From Hashicorp ............."
    wget https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_amd64.zip -P /tmp/ >/dev/null 2>&1
    unzip /tmp/terraform_*.zip
    mv terraform /usr/bin/
    rm -f /tmp/terraform_*.zip
}

which terraform >/dev/null 2>&1
if [ $? = 0 ]; then
    echo "Terraform Already Installed On The Server..........."; echo ""
    echo "The Terraform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    sleep 1
    exit 1
else
    echo "Terraform installation begins.........."
    sleep 1
    terraform_installtion
    echo "Terraform installation successful.........."; echo ""
    echo "The Terraform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    sleep 1
    exit 1
fi
```

----
## Conclusion
it's a sample bash script for compiling the latest terraform as of now Because if you have tried to install terraform via built-in repo it was old so that's why I just try to automate that latest installation. 

### ⚙️ Connect with Me 

<p align="center">
<a href="mailto:yousaf.k.hamza@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/yousafkhamza"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/></a> 
<a href="https://www.instagram.com/yousafkhamza"><img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"/></a>
<a href="https://wa.me/%2B917736720639?text=This%20message%20from%20GitHub."><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/></a><br />


