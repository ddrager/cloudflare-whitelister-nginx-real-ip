#!/bin/bash
echo "#Cloudflare" > /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
echo "#Cloudflare" > /etc/nginx/conf/cloudflare_whitelist.conf
for i in `curl https://www.cloudflare.com/ips-v4`; do
        echo "set_real_ip_from $i;" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
        echo "$i 1;" >> /etc/nginx/conf/cloudflare_whitelist.conf;
done

echo "real_ip_header CF-Connecting-IP;" >> /etc/nginx/conf.d/00_real_ip_cloudflare_00.conf;
service nginx configtest && service nginx reload
