export user=$1
export host=$2
ssh-copy-id $user@$host

# Credit: https://help.ubuntu.com/community/SSH/OpenSSH/Keys
