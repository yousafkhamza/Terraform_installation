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
    echo "The Terraform version is given below......."
    echo "-----------"
    terraform -v
    echo "-----------"
    sleep 1
    exit 1
fi
