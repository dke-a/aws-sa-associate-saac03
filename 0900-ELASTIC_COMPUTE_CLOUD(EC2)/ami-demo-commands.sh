# DBName=database name for wordpress
# DBUser=mariadb user for wordpress
# DBPassword=password for the mariadb user for wordpress
# DBRootPassword = root password for mariadb

# STEP 1 - Configure Authentication Variables which are used below
DBName='a4lwordpress'
DBUser='a4lwordpress'
DBPassword='4n1m4l$L1f3'
DBRootPassword='4n1m4l$L1f3'

# STEP 2 - Install system software - including Web and DB
sudo yum install -y mariadb-server httpd wget
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2


# STEP 3 - Web and DB Servers Online - and set to startup

sudo systemctl enable httpd
sudo systemctl enable mariadb
sudo systemctl start httpd
sudo systemctl start mariadb


# STEP 4 - Set Mariadb Root Password
mysqladmin -u root password $DBRootPassword


# STEP 5 - Install Wordpress
sudo wget http://wordpress.org/latest.tar.gz -P /var/www/html
cd /var/www/html
sudo tar -zxvf latest.tar.gz
sudo cp -rvf wordpress/* .
sudo rm -R wordpress
sudo rm latest.tar.gz


# STEP 6 - Configure Wordpress

sudo cp ./wp-config-sample.php ./wp-config.php
sudo sed -i "s/'database_name_here'/'$DBName'/g" wp-config.php
sudo sed -i "s/'username_here'/'$DBUser'/g" wp-config.php
sudo sed -i "s/'password_here'/'$DBPassword'/g" wp-config.php   
sudo chown apache:apache * -R


# STEP 7 Create Wordpress DB

echo "CREATE DATABASE $DBName;" >> /tmp/db.setup
echo "CREATE USER '$DBUser'@'localhost' IDENTIFIED BY '$DBPassword';" >> /tmp/db.setup
echo "GRANT ALL ON $DBName.* TO '$DBUser'@'localhost';" >> /tmp/db.setup
echo "FLUSH PRIVILEGES;" >> /tmp/db.setup
mysql -u root --password=$DBRootPassword < /tmp/db.setup
sudo rm /tmp/db.setup


# STEP 8 - Browse to http://your_instance_public_ipv4_ip




# Step 9

sudo yum install -y cowsay
# install animal themed utility


cowsay "oh hi"
# ascii art

# Create file /etc/update-motd.d/40-cow

sudo nano /etc/update-motd.d/40-cow

#!/bin/sh
cowsay "Amazon Linux 2 AMI - Animals4Life"

sudo chmod 755 /etc/update-motd.d/40-cow
# make sure there is permission
sudo rm /etc/update-motd.d/30-banner
# remove default or old banner

sudo update-motd
# update banner

sudo reboot

Relogin




## STEP 10 - CREATE AMI
## STEP 11 - USE AMI to launch an instance