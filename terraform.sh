#!/bin/bash

# -----------------------------------------
# Terraform installation script for Linux
# -----------------------------------------

function terraform_installtion () {
    echo "Downloading Terraform From Hashicorp ............."
    wget https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip -P /tmp/ >/dev/null 2>&1
    unzip /tmp/terraform_*.zip
    sudo mv terraform /usr/bin/
    rm -f /tmp/terraform_*.zip
}

which terraform >/dev/null 2>&1
if [ $? = 0 ]; then
    echo "Terrform Already Installed On The Server..........."; echo ""
    echo "The Terrform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    sleep 1
    exit 1
else
    echo "Terrform installation begins.........."
    sleep 1
    terraform_installtion
    echo "Terraform installation successful.........."; echo ""
    echo "The Terrform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    sleep 1
    exit 1
fi
