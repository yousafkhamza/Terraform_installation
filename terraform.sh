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
    terraform -v | grep "out of date" >/dev/null 2>&1
    if [[ "$?" = 0 ]]; then
            echo "You're terraform version is out dated so we are going to update...."
            echo "Update starts in 10sec. if you don't like to update please exit the script using [ctrl + c]...."
            for ((i=0;i<10;i++)); do sleep 1; printf "$i..\n"; done
            echo "Updation begins...."
            echo "Removing the current version of terraform...."; sudo rm -r $(which terraform)
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
