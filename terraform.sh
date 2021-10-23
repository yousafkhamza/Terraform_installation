#!/bin/bash

# -----------------------------------------
# Terraform installation script for Linux
# -----------------------------------------
function terraform_installation () {
    echo "Downloading Terraform From Hashicorp ............."
    wget $(curl -s https://www.terraform.io/downloads.html | grep linux_amd | grep -Eo 'href="[^\"]+"' | cut -d= -f2 | sed 's/["]//g') -P /tmp/ >/dev/null 2>&1
    unzip /tmp/terraform_*.zip
    sudo mv terraform /usr/bin/
    sudo rm -f /tmp/terraform_*.zip
}

which terraform >/dev/null 2>&1
if [ $? = 0 ]; then
    echo "Terrform Already Installed On The Server..........."; echo ""
    echo "The Terrform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    terraform -v | grep "out of date" 
    if [ $? = 0 ]; then
            read -p "Terraform version is out dated so do you need to update the version Y/N: " con
            if [[ "$con" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
                echo "removing current version of terraform from your device"; sudo rm -r $(which terraform)
                terraform_installation
            fi
    fi
    sleep 1
    exit 1
else
    echo "Terrform installation begins.........."
    sleep 1
    terraform_installation
    echo "Terraform installation successful.........."; echo ""
    echo "The Terrform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    sleep 1
    exit 1
fi
