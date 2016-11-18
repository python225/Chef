#!/bin/bash

#This script is use to run recipe to  multiple node.

#Get the node list and create node_list.txt file.
knife node list > node_list.txt

#Excute for loop to run the recipe to  multiple node.
#for i in `cat node_list.txt`; do knife ssh "name:$i" "sudo chef-client" -x root; done
#for i in `cat node_list.txt`; do knife ssh "name:$i" "chef-client" -a ipaddress 40.86.82.11 -x ubuntu -i /Users/rajeshpulabala/.ssh/id_rsa.pub; done

knife ssh 40.86.82.11 'sudo chef-client' --manual-list --ssh-user ubuntu -i ~/.ssh/id_rsa
