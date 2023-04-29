# Backup of Source Database
mysqldump -h 10.16.60.213 -u a4lwordpress -p a4lwordpress > a4lwordpress.sql
4n1m4ls4L1f3	

# Restore to Destination Database
mysql -h a4lwordpress1.c2pdm7e7rame.us-east-1.rds.amazonaws.com -u a4lwordpress -p a4lwordpress < a4lwordpress.sql 

# Change WP Config
cd /var/www/html
sudo nano wp-config.php

replace
/** MySQL hostname */
define('DB_HOST', 'PRIVATEIPOFMARIADBINSTANCE');

with 
/** MySQL hostname */
define('DB_HOST', 'REPLACEME_WITH_RDSINSTANCEENDPOINTADDRESS'); 