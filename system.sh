#!/bin/bash

#Andrew is  learning on the basic bash shell script and researching tutor bash online. 
#
#echo "What is the bash shellscript used for $question?"
#read question
#echo "what is your name?"
#read name
#echo "How do you do, $name?"
#read remark
#echo "I am $remark too!"
#

#Gramm-Leach-Bliley act require backup safe-secure storage. That's a LAW! No argue! :-}
#Make some backup directories  for the safe and secure storage of financial data.

#VAR is set by the variable.

#Make Directories to have backup if file don't have one exit.
if [${VAR+x/home/sysadmin/Projects/backups} ]; then
sudo mkdir /home/sysadmin/Projects/backups && sudo mkdir /home/sysadmin/Projects/backups/{freemen,diskuse,openlist,free_disk};
#echo "the file do not have one then exit."
fi

#Lists Set varibales to report output directories path
out_freemen=/home/sysadmin/Projects/backups/freemen/free_men.txt
out_diskuse=/home/sysadmin/Projects/backups/diskuse/disk_use.txt
out_openlist=/home/sysadmin/Projects/backups/openlist/open_list.txt
out_free_disk=/home/sysadmin/Projects/backups/free_disk/free_disk.txt

#Files and write data Print output
sudo echo -e "The Free Memory System is \n${VAR} \n" > $out_freemen
sudo free -h >> $out_freemen
sudo echo -e "The Disk Use is \n${VAR} \n" > $out_diskuse
sudo du -h >> $out_diskuse
sudo echo -e "The Open List is \n${VAR} \n" > $out_openlist
sudo lsof >> $out_openlist
sudo echo -e "The Free Disk Space is \n${VAR} \n" > $out_free_disk
sudo df -h >> $out_free_disk
