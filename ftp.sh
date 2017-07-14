#!/bin/bash
REMOTEHOST=172.16.100.119
USERNAME=hanbuild
PASSWORD=hanbuild



#push to ftp
        ftp  -n   $REMOTEHOST<<EOF
        user $USERNAME  $PASSWORD
        binary
        put /opt/HansightEnterprise_dev_3.3.5816.tar.gz /build/HansightEnterprise/dev/3.3/5816_pack/HansightEnterprise_dev_3.3.5816.tar.gz >/dev/null 2&>1
EOF
