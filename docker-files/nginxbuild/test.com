server {
    listen 80;
    server_name test.com;
    root /var/www/example-app-php;
    index index.php;
    
    location ~ ^/(images|javascript|js|css|flash|media|static)/ {
        expires 30d;
    }
    
   location / {
        if (!-e $request_filename) {
            rewrite ^ /index.php last;
        }
    }

    location ~ \.php$ {
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME /var/www/example-app-php$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_script_name;

        include fastcgi_params;
    }
}

