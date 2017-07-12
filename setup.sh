#!/bin/bash

#hostname=ifconfig | grep "inet 172"|awk '{ print $2}'




function __ReadINI() 
{
        INIFILE=$1
        while read line
        do
                if [ ! `echo $line | grep ^"\["` ];then
                        eval "$line"
                fi
        done < $1
}

main()
{ 
     __ReadINI /opt/config.ini
     
     hostname=`ifconfig | grep "inet 172"|awk '{ print $2}'`

     sed -i "s/$IP/$hostname/g" /opt/config.ini

     wget ftp://dev:devnj@ftp.nj.hansight.work/build/HansightEnterprise/dev/3.3/5816/HansightEnterprise_dev_3.3.5816.tar.gz

       sleep 30

       tar zxvf HansightEnterprise_dev_3.3.5816.tar.gz

       sleep 10

       \cp -f config.ini HansightEnterprise/conf

       cd /opt/HansightEnterprise/script

       ./install.sh
}
main 2>&1 | tee -a /opt/enterprise_setup.log
