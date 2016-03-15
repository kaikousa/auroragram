auroragram
==========

A personal project for collecting aurora borealis sightings around the world. The current version receives tagged images from Instagram API realtime as they are posted. Google's reverse geocoding API is used to get country of origin from the pictures that have location data attached.

In future versions we could combine different datasets such as tweets, news, scientific data about solar activity and also the Instagram posts to create these realtime event pages that collect all the available content on active auroras in the sky.

## Components

* Sinatra based API
* Instagram API integration in realtime
  * subscribe to certain hashtags (#northernlights, #auroraborealis, #auroragram)
* MongoDB for storing the posts
* a simple Angular.js application

## Nginx

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
