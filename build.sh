#!/bin/bash

# set to device ip
ip="10.0.0.18"
# set to device username
user="mobile"

rm ./derootifier-whitename.deb
rm ./derootifier-whitename/.DS_Store
rm ./derootifier-whitename/DEBIAN/.DS_Store
dpkg-deb --build derootifier-whitename
echo attempting to remove "$user"@"$ip":/var/mobile/Documents/derootifier-whitename.deb
echo cancel the script with ctrl + c if this would be malicious
ssh "$user"@"$ip" 'rm /var/mobile/Documents/derootifier-whitename.deb'
echo starting scp transfer of derootifier-whitename.deb
scp ./derootifier-whitename.deb "$user"@"$ip":/var/mobile/Documents/
