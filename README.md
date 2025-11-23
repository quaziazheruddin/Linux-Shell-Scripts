SSH Key Copy Script – Quick README
This script copies your local id_rsa.pub SSH key to multiple servers
Add all target servers (one per line) in a file named hosts_list.txt
Make sure your public key exists: ~/.ssh/id_rsa.pub.
If not use command for generate: ssh-keygen -t rsa -b 4096
Install sshpass before running the script.
If not use below command to install: sudo yum install sshpass -y
Give execute permission: chmod +x copy_ssh_keys.sh
Run the script: ./copy_ssh_keys.sh

Enter your username and password when prompted.

Script creates .ssh directory on remote hosts if missing.

Appends your key into ~/.ssh/authorized_keys on each server.

After completion, you can log in passwordlessly using SSH.

Ensure the remote servers allow password authentication temporarily.
