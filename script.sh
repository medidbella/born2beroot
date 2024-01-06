#!/bin/bash
U_ram=$(free -m | awk 'NR == 2{print $3}')
T_ram=$(free -m | awk 'NR == 2{print $2}')
P_ram=$(echo "scale=2; $U_ram * 100 / $T_ram" | bc)
P_cpu=$(mpstat | grep all | awk '{VAR=100-($13)} END {print VAR}')
if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then
	lvm="yes"
else
	lvm="no"
fi
echo "	#Archirecture: $(uname -a)
	#CPU physical: $(grep "physical id" /proc/cpuinfo | wc -l)
	#vCPU: $(grep "^processor" /proc/cpuinfo | wc -l)
	#Memory Usage: $U_ram/$T_ram MB ($P_ram)%
	#Disk Usage: $(df -m --total | grep total |awk '{print $3}')/$(df -H --total  | grep total |awk '{print $4}')b ($(df --total  | grep total |awk '{print $5}'))
	#CPU load: $P_cpu%
	#Last boot: $(who -b | awk '{print $3 " " $4}')
	#LVM use: $lvm
	#Connections TCP: $(ss -s | grep estab | awk '{print $4}' | tr -d ',') ESTABLISHED
	#User log: $(who | wc -l)
	#Network: $(hostname -I)($(ip a | grep ether | awk '{print $2}')


 
#the script is used on VMs to display these informations:

#• The architecture of your operating system and its kernel version.
#• The number of physical processors.
#• The number of virtual processors.
#• The current available RAM on your server and its utilization rate as a percentage.
#• The current available memory on your server and its utilization rate as a percentage.
#• The current utilization rate of your processors as a percentage.
#• The date and time of the last reboot.
#• Whether LVM is active or not.
#• The number of active connections.
#• The number of users using the server.
#• The IPv4 address of your server and its MAC (Media Access Control) address. • The number of commands executed with the sudo program.
