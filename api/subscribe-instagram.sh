

curl -F 'client_id=${INSTAGRAM_CLIENT_ID}' \
     -F 'client_secret=${INSTAGRAM_CLIENT_SECRET}' \
     -F 'object=tag' \
     -F 'aspect=media' \
     -F 'object_id=northernlight' \
     -F 'callback_url=http://auroragram.com/api/v1/instagram/' \
     https://api.instagram.com/v1/subscriptions/

curl -F 'client_id=${INSTAGRAM_CLIENT_ID}' \
     -F 'client_secret=${INSTAGRAM_CLIENT_SECRET}' \
     -F 'object=tag' \
     -F 'aspect=media' \
     -F 'object_id=auroraborealis' \
     -F 'callback_url=http://auroragram.com/api/v1/instagram/' \
     https://api.instagram.com/v1/subscriptions/

curl -F 'client_id=${INSTAGRAM_CLIENT_ID}' \
     -F 'client_secret=${INSTAGRAM_CLIENT_SECRET}' \
     -F 'object=tag' \
     -F 'aspect=media' \
     -F 'object_id=northernlights' \
     -F 'callback_url=http://auroragram.com/api/v1/instagram/' \
     https://api.instagram.com/v1/subscriptions/

