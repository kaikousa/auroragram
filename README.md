auroragram
==========

**Note: at the moment the project will not work as is, because Instagram deprecated the most crucial parts of their API that this project was built upon. Work on the API integration is needed to get this back into action.**

A personal project for collecting aurora borealis sightings around the world. The current version receives tagged images from Instagram API realtime as they are posted. Google's reverse geocoding API is used to get country of origin from the pictures that have location data attached.

In future versions we could combine different datasets such as tweets, news, scientific data about solar activity and also the Instagram posts to create these realtime event pages that collect all the available content on active auroras in the sky.

## Components

* Sinatra based JSON API
  * Puma is used as the app server
* nginx reverse proxy
* Instagram API integration in realtime
  * subscribe to certain hashtags (#northernlights, #auroraborealis, #auroragram)
* Google Geocoding API for reverse geocoding - translating coordinates into human readable location (eg. country)
* MongoDB for storing the posts
* a simple Angular.js application
  * fetches and displays the data from the server
* Ansible for provisioning Vagrant and production
* Supervisor for keeping the API service up and running if it would crash for some reason

## License

Copyright 2014, 2015, 2016 Kai Kousa, Eduardo Figueiredo (graphic design)

MIT-licensed, see [LICENSE.md](LICENSE.md) for more.
