#!/bin/bash

DATA=`date +%Y-%m-%d-%H`
sudo /usr/bin/mysql -e "set global wsrep_desync="ON""
sudo mkdir -p /mnt/backup/$DATA
sudo xtrabackup --backup --databases "mydb" --target-dir=/mnt/backup/$DATA/mydb
sudo xtrabackup --prepare --export --databases "mydb" --target-dir=/mnt/backup/$DATA/mydb_backup
sudo tar -czvf /mnt/backup/$DATA/mydb_backup.tar.gz -C /mnt/backup/$DATA mydb
sudo rm -rf /mnt/backup/$DATA/mydb
sudo /usr/bin/mysql -e "set global wsrep_desync="OFF""
