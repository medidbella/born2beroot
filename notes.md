

------------------------------------------------------------------NOTES---------------------------------------------------------------------------------

Config file for ssh : /etc/ssh/sshd_config                                                        

Line 14: unable the 4242 port                                                                

Line 33: root login unable with ssh                                                            

++grub = grand unified boot loader                                                            

                                                                            

-->/etc/passwd this file contains the names of the users and "x" means that the encrypted pass is in the/etc/shadow                     

the following number is the user ID and then the primary group ID and after the home directory the last field has the                     

path of the shell used by that user, the default is bash and it may be zsh or any other shell...                            

                                                                            

--> When you add a new user a group is implicitly added that has the same name as the user, the user will belong to                     

that group && when you delete that user the group also is deleted                                            

also, the default shell assigned to the user will be sh, depending on what command is used to add the                             

                                                                            

-->the config file to change password expiration date... =>etc/login.defs                                        

those changes will only apply to the users that will be created after, for already existing users you have to change                     

them manually using this command "chage" to check if the modifications are applied use "chage -l user-name"                        

                                                                            

-->the config file to change password policy /etc/pam.d/commun-password                                            

(you should install this library first "libpam-pwquality" using apt install)                                        

inside the previous file, you should add the following lines:                                                

                                                                            

"retry=3" to set a limit for incorrect password retries                                                  

"minlen=10" set a minimum number of characters                                                         

"ucredit=-1" the password should contain at least one uppercase char                                            

"lcredit=-1" .......................... one lowercase char                                                

"dcredit=-1" .......................... one digit                                                    

"checkuser=-1" the pass shouldn't contain the user name                                                 

"difok = 7" set the number of characters that must not be present in the old password                                     

"enforce_for_root" those rules will be forced even if you use root or sudo                                        

--> config file of sudo = "etc/sudoers"                                                            

(this file can mess up your whole system be careful !!)                                                    

++ Use this syntax to change the warning message that appears in case of wrong sudo password:                                

Defaults     badpass_message="new-text"                                                        

++ Use this syntax to change the max number of tries on incorrect sudo password:                                                                        

Defaults        passwd_tries=number                                                            

++ Use this syntax to change the sudo log file:                                                        

Defaults    logfile="(file-path)"                                                            

++ This syntax is used to limit which binaries (commands/programs) sudo can run                                        

secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"                                        

":" means or                                                                         

----------------------------------------------------------------COMMANDS--------------------------------------------------------------------------------

                                                                            

++ Here is how to check if a service is working (ufw is an example) "systemctl status ufw"                                

++ ip address = "hostname -I"                                                                

++ adding a user  = "adduser user-name"                                                            

++ delete user = "userdel user-name"                                                            

++ list users = "cat /etc/passwd"                                                            

++ change the name of a user = "usermod -l new-name old-name"                                                

++ set pass to user = "sudo passwd user-name"                                                        

++ Change the shell used by the user : "usermod user-name --shell /bin/bash"                                        

++ add group: "groupadd group-name"                                                            

++ Add a user to a group : "usermod -aG group-name user-name"                                                

the -a is used to add the user to the group without removing him from the previous groups                                 

++ del group: "groupdel group-name"                                                            

++ list groups = "cat /etc/group"                                                            

++ delete a user from a group = "deluser user-name group-name"                                                

++ list the groups of a user = "groups user-name"                                                    

++ check the password information (last modification expire ...)= "chage -l user-name"                                    

++ use change warning expire date = "chage -W number user-name"                                                

++ expire date of a password= "chage -E number user-name"                                                

++ min number of days to change the pass = "chage -m number user-name"                                            

++ how to change your hostname = "sudo hostnamectl set-hostname <newhostname>"                                        

                                                                            

--------------------------------------------------------------CONCEPTS----------------------------------------------------------------------------------

                                                                            

                                               BOOT process:                                            

                                              ______________              



                                                                            

1_power on---2_BOIS/UEFI---post(checks if all of the hardware is working)--Bois looks for the boot loader software which is                 

located in the master boot record (READONLY)--the boot loader looks for an OS in all the disks and removable memories in                

a customizable order boot (loader grub in our case) puts the kernel in the memory, and then the kernel does the remaining work such as            

checking the drivers it runs the system starts all the background processes you need and handles user login.                        

                                                                            

                               SSH:                                                 

                                 ____                                                

                                                                             

ssh stands for secure shell and it is considered a secure network protocol and also a tool used for remoting ++ it is the standard            

way to connect to a server with the help of SSH you can perform any command that your user can remotely just like if you                 

are standing in front of it and this condition is considered safe and secure since it is encrypted                            

                                                                                                                                                                                                 

                                                                                                                                                    Ports:                                                

                                        ______                                                

                                                                            

ports are logical connections that are used to organize data transfer by assigning a unique port number to a specific service for             

example port 80 is used for web only and                                                         

port 22 for ssh connections                                                                   

                                                                            

                              debian vs rocky:                                            

                            _______________                                            

                                                                            

ROCKY:                                                                            

                                                                            

Rocky is developed by the CEO of centOS so it is considered the replacement for centOS                                    

because they stopped the production, and centos is open source rocky uses dnf as its default package manager Rockey is used by                 

companies more than normal users because it is kinda hard to use if you are new to system administration also Rockey has one version only        

that gets updated from time to time                                                            

                                                                            

DEBIAN:                                                                            

                                                                            

Debian is an open-source OS , the second most used OS for servers, Debian has three versions testing unstable and stable, Debian has "apt"         

as a package manager, Debian often has old versions of software and the same thing applies for drivers besides those downsides debian            

is stable and secure                                                                    

                                                                            

                              UFW:                                                

                                    _____                                                

                                                                            

ufw stands for uncomplicated firewall and it is a program that manages netfilter firewall                                

(network security system that is provided by the Linux kernel that controls incoming and outgoing network traffic based on predetermined         

security rules), this UFW is designed to be simple and easy to use, it uses a command line interface it is the default for Ubuntu and debain         

                                                                            

                            APP armor:                                            

                            __________                                            

                                                                            

is a Debian alternative of SElinux for rocky, and it is a software that is used to control and limit the access of programs and other software         

to parts of the system.                                                                    

                                                                            

                             USERADD VS ADDUSER:                                        

                             __________________                                        

                                                                            

when you want to add a new user you can use two commands sudo "adduser" or "useradd"                                    

the adduser command is easy to use it automatically asks you to set a password and it sets the shell used by the user to bash and creates a         

home directory for that user and more but when you use the useradd command you should use the "-m" to create the home directory  and "-p" to insert a     

password and -s to set the shell you want so the conclusion is that adduser is an alias of user add plus flags to be beginner friendly.            

                                                                            

                                 SUDO:                                            

                                 ____                                                

sudo stands for superuser do, in Linux the super user is "root" and this user can do anything in the system and this but the other user has         

limited privileges, when a user wants to use a command that only the root has the right to he can use sudo before writing the command as long        

as the root user added this user to the sudo group,                                                    

when trying to use the sudo before using a command you will be asked to insert the current user password.                        

-->!!if a user wants to use sudo he must be in the sudo group or his name must be in the config file of sudo                         

("/etc/sudoers") like this ==> "user-name ALL=(ALL:ALL) ALL"                                                 

--------------------------------------------------------------------------------------------------------------------------------------------------------/