#!/bin/bash
###################################################################################################################################################
# Script Name: copy_ssh_keys.sh                                                                                                                   #
# Description: This script copies the local machine's public SSH key to a list of remote servers to enable passwordless login.                    #
#			   It prompts the user for username and password, and then configures SSH access on each server listed in 'host.txt'.                 #
#                                                                                                                                                 #
# Created By : Quazi Azheruddin                                                                                                                   #
# Created On : 2021-12-23                                                                                                                         #
#                                                                                                                                                 #
# Version History:                                                                                                                                #
# Version 1.0 - 2021-12-23                                                                                                                        #
#   * Initial script created for distributing SSH keys to multiple servers.                                                                       #
#                                                                                                                                                 #
# Modified By :                                                                                                                                   #
# Modified On :                                                                                                                                   #
# Modification Details :                                                                                                                          #
#                                                                                                                                                 #
###################################################################################################################################################                                                  

echo -n "Enter User Name: "
read user

echo -n "Enter the Password: "
read -s pass
echo ""

key=$(cat ~/.ssh/id_rsa.pub)

for server in $(cat hosts_list.txt); do
    sshpass -p "$pass" ssh -o StrictHostKeyChecking=no $user@$server "mkdir -p ~/.ssh; echo $key >> ~/.ssh/authorized_keys" > /dev/null 2>&1 &
    echo "Public key copied to server: $server"
done
