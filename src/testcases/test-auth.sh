#!/bin/bash
URL=YOUR_URL

curl -k -vvvv https://$YOUR_URL/prodrestaurant


#APIKey
KEY=app_key
curl -k -vvvv https://$YOUR_URL/prodpaidrestaurant
curl -k -vvvv https://$YOUR_URL/prodpaidrestaurant?apikey=$KEY

#OAuth
KEY=OAUTH_KEY
SECRET=OAUTH_SECRET
URL=YOUR_URL
curl -k -vvvv https://$URL/adminrestaurants

TOKEN=`curl -k -vvvv -H "Content-Type: application/x-www-form-urlencoded" "https://$URL/oauth/client_credential/accesstoken?grant_type=client_credentials" -d "client_id=$KEY&client_secret=$SECRET" | jq -r .access_token`
curl -k -vvvv https://$URL/adminrestaurants -H "Authorization: Bearer $TOKEN"
curl -k -vvvv -X POST https://$URL/adminrestaurants \
    -H "Authorization: Bearer $TOKEN" \
    -H 'Content-Type: application/json' \
    -d '{
    "data": {
        "Name": "DEF Seafood",
        "Website": "https://defseafood.com",
        "Cuisine": "Seafood"
    }
}'