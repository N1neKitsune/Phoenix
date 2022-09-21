#!/bin/bash

Createnode() {
    terraform init 
    terraform plan 
    terraform apply 
}

path=$(pwd)

cd $path'/C2_Ubuntu-20'
Createnode

cd $path'/PhishingServ_Ubuntu-20'    
Createnode

cd $path
