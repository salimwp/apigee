#!/bin/bash
curl -k -vvvv https://apigee.elysautus.io/prodrestaurant


#APIKey
KEY=PqUiMY18hKAm5mDOqppqAtAealSyyPZSiooemFklT3i4V2B3
curl -k -vvvv https://apigee.elysautus.io/prodpaidrestaurant
curl -k -vvvv https://apigee.elysautus.io/prodpaidrestaurant?apikey=$key

#OAuth
KEY=ha2Vw3rmXMPNd37UlGEVHQGD9PsAiSYVEGXIJxV2Y4tATREM
SECRET=HpasPLRq4X51wHj7yl3El8Urnle5QvqoGNZwfssV3fhfzoJWdAGm0X0YB3xLIyWv
URL=apigee.elysautus.io
curl -k -vvvv https://apigee.elysautus.io/adminrestaurants

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