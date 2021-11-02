#!/bin/bash

# -----------------------------------------
# Terraform installation script for Linux
# -----------------------------------------
function terraform_installation () {
    echo "Downloading Terraform From Hashicorp ............."
    sudo rm -f /tmp/terraform_*.zip
    wget --no-check-certificate $(curl -s https://www.terraform.io/downloads.html | grep linux_amd | grep -Eo 'href="[^\"]+"' | cut -d= -f2 | sed 's/["]//g') -P /tmp/ >/dev/null 2>&1
    if [ $? = 0 ]; then
        unzip /tmp/terraform_*.zip
        sudo mv terraform /usr/bin/
        sudo rm -f /tmp/terraform_*.zip
    else
            echo "Terraform Downloading is failed.... So, please be try the same via manually"
            echo "https://www.terraform.io/downloads.html"
    fi
}

which terraform >/dev/null 2>&1
if [ $? = 0 ]; then
    echo "Terrform Already Installed On The Server..........."; echo ""
    echo "The Terrform version is given below......"
    echo "-----------"
    terraform -v
    echo "-----------"
    terraform -v | grep "out of date" >/dev/null 2>&1
    if [ $? = 0 ]; then
        echo "You're terraform version is outdated so we are going to update automatically...."
        echo "Automatic update when starts in 10sec. if you haven't needs to update please be exit the script while the countdown using [ctrl + c]...."
        echo "Countdown Begins..."
        # for ((i=0;i<10;i++)); do sleep 1; printf "$i..\n"; done #forward count
        count=9; ((++count)) ; while ((--count >=0)); do echo  -e "\033[31;5m$count..\033[0m"; done; #backword countdown
        echo "Updation begins...."
        echo "Removing the current version of terraform....";
        sudo rm -rf $(which terraform)
        terraform_installation
        echo "Terrafrom Updation is successful. Current version is given below......"
        echo "-----------"
        terraform -v
        echo "-----------"
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
