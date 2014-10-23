

curl -F 'client_id=' \
     -F 'client_secret=' \
     -F 'object=tag' \
     -F 'aspect=media' \
     -F 'object_id=northernlight' \
     -F 'callback_url=http://auroragram.com/api/v1/instagram/' \
     https://api.instagram.com/v1/subscriptions/
