auroragram
==========

```
upstream lb-aurora-api {
  ip_hash;
  server 127.0.0.1:3000;
}

server {
  listen 80;
  server_name auroragram.com;

  location ^~ /api/v1 {
    #rewrite ^/api/v1(.*)$ $1 break;
    proxy_pass http://lb-aurora-api;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }

  location / {
    root /home/kai/projects/auroragram/app;
  }
}

server {
  server_name www.auroragram.com;
  return 302 $scheme://auroragram.com$request_uri;
}

```
