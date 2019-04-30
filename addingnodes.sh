#!bin/bash

#knife bootstrap skoruzuser2.mylabserver.com -x root -P fremont555 --node-name 'test-server'
sudo knife bootstrap x.x.x.x --ssh-user ubuntu -i ~/.ssh/id_rsa --sudo --node-name 'example.com'
#sudo knife bootstrap 54.196.128.5 --ssh-user root --ssh-password fremont555 --node-name 'testing'


