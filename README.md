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
