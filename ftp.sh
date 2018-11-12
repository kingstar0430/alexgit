#!/bin/bash
REMOTEHOST=172.16.219.7
USERNAME=test
PASSWORD=123qwe



#push to ftp
        ftp  -n   $REMOTEHOST<<EOF
        user $USERNAME  $PASSWORD
        binary
        put /opt/*_3.6.6841.tar.gz /Enterprisev3.2/*_3.6.6841.tar.gz >/dev/null 2&>1
EOF
