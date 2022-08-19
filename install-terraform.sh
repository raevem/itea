#!/bin/sh

echo "-----------------------------------"
echo "|Step 1:Install Terraform packages|"
echo "-----------------------------------"
sleep 3
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
echo "--------------------------"
echo "|Step 2: Download GPG key|"
echo "--------------------------"
sleep 3
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "------------------------"
echo "|Step 3: Verify GPG key|"
echo "------------------------"
sleep 3
echo off gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "--------------------------------------------------------------"
echo "|Step 4: Add the official HashiCorp repository to your system|"
echo "--------------------------------------------------------------"
sleep 3
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
echo "-----------------------"
echo "|Step 5: update system|"
echo "-----------------------"
sleep 3
apt update
echo "---------------------------"
echo "|Step 6: Install Terraform|"
echo "---------------------------"
sleep 3
apt install terraform
echo "-----------------------------"
echo "|Step 7: Enable autocomplete|"
echo "-----------------------------"
sleep 3
touch ~/.bashrc
echo "------------------------------------------"
echo "|Step 8: Install the autocomplete package|"
echo "------------------------------------------"
sleep3
terraform -install-autocomplete
echo "----------------------------------"
echo "|Step 9: Add AWS Programmatic key|"
echo "----------------------------------"
sleep 3
export AWS_ACCESS_KEY_ID=AKIAWFRSJTUFKNRVTDK3
export AWS_SECRET_ACCESS_KEY=export AWS_SECRET_ACCESS_KEY=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
echo "Done"
sleep 3
echo "---------------------------------"
echo "|Step 10: Create folder for work|"
echo "---------------------------------"
sleep 3
echo "/home/raev/Documents/GoLangServer"
cd /home/raev/Documents/
mkdir GoLangServer
cd GoLangServer
echo "Done"
sleep 3
echo "----------------------"
echo "|Step 11: Install Git|"
echo "----------------------"
sleep 3
apt install git-all
echo "-------------------------------------"
echo "|Step 12: Connect to public Git repo|"
echo "-------------------------------------"
sleep 3
cd /home/raev/Documents/GoLangServer
git clone https://github.com/raevem/itea.git
#echo "-----------------------------"
#echo "|Step 13: Install amazon cli|"
#echo "-----------------------------"
#sleep 3
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#sudo ./aws/install
#echo "--------------------------"
#echo "|Step 14: create ECS infra|"
#echo "--------------------------"
#sleep 3
#aws configure
#aws eks create-cluster --name dockercluster \
#--role-arn arn:aws:iam::424233508106:role/cluster-eks \
#--resources-vpc-config subnetIds=subnet-0da0527903adf5c26,securityGroupIds=sg-0ba966e8005faeaf7
echo "------------------------------------------------"
echo "|Step 15: Run setup infrastructure from main.tf|"
echo "|It will be created two ECS instanses  with    |"
echo "|one of Jenkins and some service               |"
echo "------------------------------------------------"
sleep 3
cd /home/raev/Documents/GoLangServer/itea/infrastructure
terraform init
terraform fmt
terraform apply
