#set timezone
echo $TIMEZONE > /etc/timezone

# Change apache config
#sed -i 's/#ServerAdmin\ you@example.com/ServerAdmin\ you@example.com/' /etc/apache2/httpd.conf
sed -i "s/#ServerName\ www.example.com:80/ServerName\ $WEBSITE_URL/" /etc/apache2/httpd.conf
#sed -i 's#^DocumentRoot ".*#DocumentRoot "/htdocs"#g' /etc/apache2/httpd.conf
#sed -i 's#Directory "/var/www/localhost/htdocs"#Directory "/htdocs"#g' /etc/apache2/httpd.conf
#sed -i 's/#AllowOverride None/AllowOverride All/' /etc/apache2/httpd.conf
#sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf
#sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf
#sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf



cat /apache.conf >> /etc/apache2/httpd.conf

tail /dev/null
#httpd-foreground