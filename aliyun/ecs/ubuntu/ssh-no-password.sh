# Refer to https://help.ubuntu.com/community/SSH/OpenSSH/Keys
export user=$1
export host=$2
ssh-copy-id $user@$host
