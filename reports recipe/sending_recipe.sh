#!/bin/bash

#This script is use to add recipe to  multiple node.

#Enter the recipe name which need to add.
recipe_name=$1
recipe_name=sendreports


#Get the node list and create node_list.txt file.
knife node list > node_list.txt

#Excute for loop to remove recipes from multiple node.
for i in `cat node_list.txt`; do knife node run_list add $i recipe[sendingreports::$recipe_name] ; done
