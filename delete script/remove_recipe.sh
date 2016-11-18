#!/bin/bash

#This script is use to remove recipe from multiple node.

#Enter the recipe name which need to remove.
recipe_name=$1
recipe_name=default
#recipe_name=allpatch
#recipe_name=critical

#get the node list and create node_list.txt file.
knife node list > node_list.txt

#Excute for loop to remove recipes from multiple node.
for i in `cat node_list.txt`; do knife node run_list remove $i recipe[deletescript::$recipe_name] ; done
